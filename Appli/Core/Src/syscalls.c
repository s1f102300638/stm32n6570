/**
  ******************************************************************************
  * @file    syscalls.c
  * @brief   Minimal system calls implementation for STM32 Appli project
  ******************************************************************************
  */

#include <errno.h>
#include <sys/stat.h>

/* These are stub implementations to resolve libc warnings */

__attribute__((weak)) int _close(int file) 
{
    return -1;
}

__attribute__((weak)) int _lseek(int file, int ptr, int dir) 
{
    return 0;
}

__attribute__((weak)) int _read(int file, char *ptr, int len) 
{
    return 0;
}

__attribute__((weak)) int _write(int file, char *ptr, int len) 
{
    /* Basic implementation - could be connected to UART for printf */
    for (int i = 0; i < len; i++) {
        /* Could output to UART here */
    }
    return len;
}

__attribute__((weak)) int _fstat(int file, struct stat *st) 
{
    st->st_mode = S_IFCHR;
    return 0;
}

__attribute__((weak)) int _isatty(int file) 
{
    return 1;
}

__attribute__((weak)) void *_sbrk(int incr) 
{
    extern char _end;
    static char *heap_end = NULL;
    char *prev_heap_end;

    if (heap_end == NULL) {
        heap_end = &_end;
    }
    prev_heap_end = heap_end;
    heap_end += incr;
    
    return (void *)prev_heap_end;
}

/* End of File */
