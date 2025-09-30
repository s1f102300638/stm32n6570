# カメラ統合ガイド - STM32N657プロジェクト

## エラー修正完了状態

`imx335.h: No such file or directory` エラーは、`main.h`でカメラ関連インクルードを一時的にコメントアウトすることで解決しました。

## 次のステップ: カメラ機能の有効化

### 1. STM32CubeIDEでインクルードパスを追加

**手順:**

1. **プロジェクトを右クリック** → `Properties` を選択
2. `C/C++ General` → `Paths and Symbols` を選択
3. `Includes` タブで、`GNU C` を選択
4. `Add...` ボタンをクリックして、以下のパスを追加:

```
../Drivers/BSP/Components/IMX335
../Drivers/BSP/Components/Common
../Drivers/BSP/Components/rk050hr18
../Middlewares/STM32_ISP/inc
../FSBL/Core/Inc
```

**重要**: 各パスで `Add to all configurations` と `Add to all languages` にチェックを入れてください。

### 2. main.hのカメラインクルードを有効化

`Appli/Core/Inc/main.h` を開き、以下のコメントを解除:

```c
/* 以下の行のコメントを解除 */
#include "imx335.h"
#include "camera.h"
#include "rk050hr18.h"
#include "isp_api.h"
#include "imx335_E27_isp_param_conf.h"

/* カメラ設定も有効化 */
#define USE_COM_LOG 1
#define CAMERA_IMX335_ADDRESS 0x34U
#define FRAME_WIDTH  800
#define FRAME_HEIGHT 480
#define FRAME_BUFFER_SIZE (FRAME_WIDTH * FRAME_HEIGHT * 2)
#define BUFFER_ADDRESS  0x34200000  /* AXISRAM3 */

/* 外部ハンドル宣言も有効化 */
extern DCMIPP_HandleTypeDef hdcmipp;
extern LTDC_HandleTypeDef hltdc;
extern ISP_HandleTypeDef hcamera_isp;
```

### 3. 必要なソースファイルの確認

カメラ機能を動作させるには、以下のファイルがビルドに含まれている必要があります:

**BSPドライバ:**
- `Drivers/BSP/Components/IMX335/imx335.c`
- `Drivers/BSP/Components/IMX335/imx335_reg.c`
- `Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.c`
- `Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.c`

**ISPミドルウェア:**
- `Middlewares/STM32_ISP/src/*.c` (すべてのファイル)

**カメラアプリケーション:**
- カメラ制御用のソースファイル（`prj_stm32n6_cam`からコピー予定）

### 4. カメラ初期化コードの統合

`prj_stm32n6_cam` プロジェクトから以下のコードを参照して統合:

1. **カメラ初期化関数**
   - I2C初期化
   - DCMIPP初期化
   - IMX335センサー設定

2. **microT-Kernelタスク**
   - カメラキャプチャタスク
   - フレーム処理タスク

3. **割り込みハンドラ**
   - DCMIPP割り込み優先度設定（5以上）
   - フレーム完了コールバック

### 5. RISAF設定の追加

DCMIPP動作に必須のRISAF設定を追加:

```c
/* RISAF設定例 */
void Configure_RISAF_for_Camera(void) {
    /* RISAF設定コードをここに追加 */
    /* DCMIPPがAXISRAM3にアクセスできるように設定 */
}
```

## 推奨実装順序

公式ドキュメント（UM3234、AN6211）の推奨に基づく実装順序:

### Phase 1: ビルド環境の整備（現在完了）
- ✅ インクルードパス設定
- ✅ main.hの修正

### Phase 2: 基本的なカメラ初期化（次のステップ）
1. RTOS起動前の初期化
   - SystemClock_Config (800MHz)
   - GPIO初期化
   - I2C初期化
   - DCMIPP周辺機器初期化

2. RTOSタスクでのカメラ制御
   - I2C経由でIMX335設定
   - DCMIPP Pipe設定
   - キャプチャ開始

### Phase 3: フレーム処理の実装
- バッファ管理（ダブル/トリプルバッファリング）
- フレーム完了イベント処理
- YOLO推論との連携

### Phase 4: 最適化
- RISAF細調整
- ISPパラメータチューニング
- 電源管理

## トラブルシューティング

### コンパイルエラーが発生する場合

1. **インクルードパスの確認**
   - プロジェクトプロパティで正しく設定されているか
   - パスが相対パスで正しいか

2. **ソースファイルの確認**
   - 必要な.cファイルがビルドに含まれているか
   - Project Explorer でファイルが灰色（除外）になっていないか

3. **依存関係の確認**
   - imx335_reg.h などの依存ヘッダーが存在するか

### リンクエラーが発生する場合

1. **未定義シンボル**
   - 対応する.cファイルがビルドに含まれているか確認

2. **ライブラリ不足**
   - 必要なミドルウェアライブラリがリンクされているか

## 参考資料

- **UM3234**: STM32N6 Boot ROM使用方法
- **AN6211**: DCMIPP入門ガイド
- **公式リサーチレポート**: FSBLとアプリケーション間の設計指針

## 次回作業時の確認事項

- [ ] インクルードパスの設定完了
- [ ] main.hのコメント解除
- [ ] カメラ初期化コードの統合開始
- [ ] prj_stm32n6_camからの必要ファイル特定

---
**注意**: カメラ機能の完全な統合には、`prj_stm32n6_cam`プロジェクトの詳細な分析が必要です。
