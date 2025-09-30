#include <tk/tkernel.h>
#include <tm/tmonitor.h>

/* Note: GPIO_ODR macro is already defined in sysdef.h */
/* No need to redefine it here */

/* Task prototypes */
LOCAL void task_1(INT stacd, void *exinf);
LOCAL void task_2(INT stacd, void *exinf);
LOCAL void camera_task(INT stacd, void *exinf);

/* Task IDs */
LOCAL ID tskid_1;
LOCAL ID tskid_2;
LOCAL ID tskid_camera;

/* Task 1 creation information */
LOCAL T_CTSK ctsk_1 = {
	.itskpri	= 10,
	.stksz		= 1024,
	.task		= task_1,
	.tskatr		= TA_HLNG | TA_RNG3,
};

/* Task 2 creation information */
LOCAL T_CTSK ctsk_2 = {
	.itskpri	= 10,
	.stksz		= 1024,
	.task		= task_2,
	.tskatr		= TA_HLNG | TA_RNG3,
};

/* Camera task creation information */
LOCAL T_CTSK ctsk_camera = {
	.itskpri	= 8,		// Higher priority than task_1/2
	.stksz		= 2048,		// Larger stack for camera operations
	.task		= camera_task,
	.tskatr		= TA_HLNG | TA_RNG3,
};

/**
  * @brief  Task 1 - LED blink task
  * @param  stacd  Start code
  * @param  exinf  Extended information
  * @retval None
  */
LOCAL void task_1(INT stacd, void *exinf)
{
	while(1) {
		tm_printf((UB*)"task 1\n");

		/* Inverts the LED on the board. */
		out_h(GPIO_ODR(O), in_h(GPIO_ODR(O))^(1<<1));

		tk_dly_tsk(500);
	}
}

/**
  * @brief  Task 2 - Periodic print task
  * @param  stacd  Start code
  * @param  exinf  Extended information
  * @retval None
  */
LOCAL void task_2(INT stacd, void *exinf)
{
	while(1) {
		tm_printf((UB*)"task 2\n");
		tk_dly_tsk(700);
	}
}

/**
  * @brief  Camera task - Starts camera capture and monitors frames
  * @param  stacd  Start code
  * @param  exinf  Extended information
  * @retval None
  */
LOCAL void camera_task(INT stacd, void *exinf)
{
	extern void Camera_Start_Capture(void);
	
	tm_printf((UB*)"Camera task started\n");
	
	/* Start camera capture (DCMIPP + ISP) */
	Camera_Start_Capture();
	
	tm_printf((UB*)"Camera capture started\n");
	
	/* Periodic monitoring */
	while(1) {
		/* Frame processing happens in callbacks */
		/* This task just provides periodic status */
		tk_dly_tsk(1000);  // 1 second interval
		
		tm_printf((UB*)"Camera running\n");
	}
}

/**
  * @brief  User main function - Entry point for application
  * @retval Return code
  */
EXPORT INT usermain(void)
{
	tm_putstring((UB*)"Start User-main program.\n");

	/* Turn off the LED on the board. */
	out_h(GPIO_ODR(O), in_h(GPIO_ODR(O))&~(1<<1));

	/* Create & Start Camera Task (highest priority) */
	tskid_camera = tk_cre_tsk(&ctsk_camera);
	if (tskid_camera > 0) {
		tk_sta_tsk(tskid_camera, 0);
		tm_printf((UB*)"Camera task created\n");
	} else {
		tm_printf((UB*)"Camera task creation failed\n");
	}

	/* Create & Start Task 1 */
	tskid_1 = tk_cre_tsk(&ctsk_1);
	if (tskid_1 > 0) {
		tk_sta_tsk(tskid_1, 0);
	}

	/* Create & Start Task 2 */
	tskid_2 = tk_cre_tsk(&ctsk_2);
	if (tskid_2 > 0) {
		tk_sta_tsk(tskid_2, 0);
	}

	/* Sleep forever - let tasks run */
	tk_slp_tsk(TMO_FEVR);

	return 0;
}
