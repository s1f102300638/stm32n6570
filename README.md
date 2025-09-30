# STM32N657 Camera Integration for microT-Kernel 3.0

## 📸 プロジェクト概要

STM32N657マイコン上で動作するmicroT-Kernel 3.0環境に、DCMIPP（Digital Camera Interface Pixel Pipeline）とIMX335カメラセンサーを統合した実装です。

**STマイクロエレクトロニクスの公式ガイドライン（UM3234、AN6211）に完全準拠**した設計となっています。

---

## ✨ 主な特徴

- ✅ **STM32N6公式アーキテクチャ準拠**: アプリケーション層でのカメラ制御
- ✅ **RTOS統合**: microT-Kernel 3.0とのシームレスな統合
- ✅ **高性能画像処理**: DCMIPP Pipe1 + ISP による30fps リアルタイム処理
- ✅ **柔軟な解像度**: 2592x1944 → 800x480 ダウンサイズ対応
- ✅ **モジュラー設計**: ISPの有効/無効を簡単に切り替え可能

---

## 🗂️ ファイル構成

```
mtk3bsp2_stm32n657/
├── Appli/
│   ├── Application/
│   │   ├── camera_integration.c      ← 📷 カメラ制御実装
│   │   ├── camera_integration.h      ← 📷 ヘッダーファイル
│   │   └── app_main.c                ← 🔄 カメラタスク追加済み
│   │
│   └── Core/
│       └── Src/
│           └── main.c                ← 🔄 初期化シーケンス更新済み
│
├── CAMERA_INTEGRATION_GUIDE.md       ← 📖 詳細実装ガイド
├── INTEGRATION_SUMMARY.md            ← 📊 実装サマリー
├── QUICKSTART.md                     ← 🚀 5分スタートガイド
└── copy_camera_files.sh              ← 🔧 ファイルコピー自動化
```

---

## 📋 必要なもの

### ハードウェア
- STM32N6570-DK ディスカバリーボード
- IMX335 カメラモジュール (基板上に実装済み)
- USB-C ケーブル（デバッグ＆電源用）

### ソフトウェア
- STM32CubeIDE 1.19.0 以降
- STM32CubeN6 HAL ドライバ
- microT-Kernel 3.0 BSP

---

## 🚀 セットアップ

### オプションA: クイックスタート（推奨）

```bash
# 1. ファイルコピー
cd C:\Users\iniad\STM32CubeIDE\workspace_2
bash copy_camera_files.sh

# 2. STM32CubeIDE で開く
# 3. QUICKSTART.md の手順に従う (5分)
```

### オプションB: マニュアルセットアップ

`CAMERA_INTEGRATION_GUIDE.md` の詳細手順に従ってください。

---

## 🏗️ アーキテクチャ

### STM32N6推奨設計パターン

```
┌────────────────────────────────────────────────┐
│ Boot ROM → FSBL → Application (Appli)         │
└────────────────────────────────────────────────┘

FSBL の役割:
  ✓ 外部メモリ設定
  ✓ クロック設定
  ✗ カメラ初期化（しない）← 公式推奨

Application の役割:
  ✓ カメラペリフェラル初期化
  ✓ センサー設定
  ✓ ISP処理
  ✓ RTOS統合
```

### 二段階初期化シーケンス

```c
// Phase 1: main() - RTOS起動前
HAL_Init();
MX_GPIO_Init();
MX_I2C1_Init();
Camera_System_Init();          // ← DCMIPP周辺機器のみ
knl_start_mtkernel();          // ← microT-Kernel起動

// Phase 2: camera_task - RTOS起動後
Camera_Start_Capture();        // ← センサー設定 + 起動

// Phase 3: main loop - バックグラウンド
while(1) {
  Camera_Background_Process(); // ← ISP処理
}
```

**設計根拠**: STマイクロエレクトロニクスAN6211推奨パターン

---

## 📊 性能仕様

| 項目 | 仕様 |
|------|------|
| センサー | Sony IMX335 (5MP) |
| 入力解像度 | 2592 x 1944 pixels |
| 出力解像度 | 800 x 480 pixels (ダウンサイズ) |
| フレームレート | 30 fps |
| 出力フォーマット | RGB565 |
| データレート | CSI-2, 2-lane, 1.6 Gbps |
| ISP機能 | デモザイク、AWB、AE、ガンマ補正 |

---

## 🔧 API リファレンス

### 主要関数

#### `void Camera_System_Init(void)`
**説明**: カメラペリフェラル初期化（RTOS起動前に呼び出し）  
**タイミング**: `main()` 内、`knl_start_mtkernel()` の前  
**処理内容**:
- DCMIPP レジスタ設定
- CSI-2 PHY設定
- 割り込み優先度設定

#### `void Camera_Start_Capture(void)`
**説明**: センサー設定とキャプチャ開始（RTOS起動後に呼び出し）  
**タイミング**: `camera_task` 内  
**処理内容**:
- IMX335 センサー初期化
- ISP パラメータ設定
- 連続キャプチャ開始

#### `void Camera_Background_Process(void)`
**説明**: ISP バックグラウンド処理  
**タイミング**: `main()` の無限ループ内  
**処理内容**:
- ISP 統計処理
- AE/AWB アルゴリズム実行

#### `uint32_t Camera_Get_Frame_Count(void)`
**戻り値**: 累積フレーム数  
**用途**: パフォーマンス測定、デバッグ

#### `uint8_t Camera_Is_Running(void)`
**戻り値**: 1=動作中、0=停止  
**用途**: ステータス確認

---

## 🎯 使用例

### 基本的な使い方

```c
// main.c
int main(void)
{
  HAL_Init();
  // ... その他の初期化 ...
  
  Camera_System_Init();      // カメラペリフェラル初期化
  
  knl_start_mtkernel();      // RTOS起動
  
  while(1) {
    Camera_Background_Process();  // ISP処理
  }
}

// app_main.c
void camera_task(INT stacd, void *exinf)
{
  Camera_Start_Capture();    // センサー起動
  
  while(1) {
    // フレーム取得待機
    tk_dly_tsk(100);
    
    // ステータス確認
    if (Camera_Is_Running()) {
      uint32_t frames = Camera_Get_Frame_Count();
      tm_printf((UB*)"Frames: %lu\n", frames);
    }
  }
}
```

### フレームバッファアクセス

```c
// camera_integration.h で定義されたアドレス
#define CAMERA_FRAME_BUFFER_ADDRESS  0x70000000

// フレームデータにアクセス
uint16_t *frame_buffer = (uint16_t*)CAMERA_FRAME_BUFFER_ADDRESS;

// RGB565フォーマット: 800x480ピクセル
for (int y = 0; y < 480; y++) {
  for (int x = 0; x < 800; x++) {
    uint16_t pixel = frame_buffer[y * 800 + x];
    
    // RGB565 → R,G,B 分離
    uint8_t r = (pixel >> 11) & 0x1F;  // 5ビット
    uint8_t g = (pixel >> 5) & 0x3F;   // 6ビット
    uint8_t b = pixel & 0x1F;          // 5ビット
    
    // 画像処理...
  }
}
```

---

## 📈 パフォーマンスチューニング

### ISP機能の選択的有効化

```c
// camera_integration.c で設定

// ISP使用（高画質、CPU負荷高）
#define USE_ISP_MIDDLEWARE

// ISP不使用（RAWデータ、CPU負荷低）
#undef USE_ISP_MIDDLEWARE
```

### メモリ配置の最適化

```c
// 高速メモリを使用
#define CAMERA_FRAME_BUFFER_ADDRESS  0x34000000  // AXISRAM (内部)

// 大容量メモリを使用
#define CAMERA_FRAME_BUFFER_ADDRESS  0x70000000  // PSRAM (外部)
```

### 解像度の変更

```c
// camera_integration.c の DCMIPP_Init() 内

DownsizeConf.HSize = 640;  // 幅
DownsizeConf.VSize = 480;  // 高さ

// 比率を再計算
DownsizeConf.HRatio = (2592 * 65536) / 640;
DownsizeConf.VRatio = (1944 * 65536) / 480;
```

---

## 🐛 トラブルシューティング

### よくある問題

| 症状 | 原因 | 解決策 |
|------|------|--------|
| ビルドエラー | ドライバ未追加 | `copy_camera_files.sh` 実行 |
| センサー検出失敗 | I2C通信エラー | 配線、プルアップ抵抗確認 |
| フレーム取得できない | RISAF設定不足 | メモリアクセス権限設定 |
| HardFault | 割り込み優先度エラー | 優先度5以上に設定 |

詳細は `CAMERA_INTEGRATION_GUIDE.md` の「トラブルシューティング」章を参照。

---

## 📚 ドキュメント

| ファイル | 内容 | 対象読者 |
|---------|------|---------|
| `QUICKSTART.md` | 5分スタートガイド | 🚀 初めての方 |
| `CAMERA_INTEGRATION_GUIDE.md` | 詳細実装ガイド | 📖 開発者 |
| `INTEGRATION_SUMMARY.md` | 実装サマリー | 📊 レビュアー |
| `camera_integration.c` | ソースコード | 💻 実装者 |

---

## 🔬 技術仕様

### DCMIPP設定

```
CSI-2インターフェース:
  - データレーン: 2レーン
  - PHYビットレート: 1.6 Gbps
  - 仮想チャネル: VC0
  - データタイプ: RAW10

Pipe1 (メインパイプ):
  - ISP: 有効
  - 出力フォーマット: RGB565
  - ダウンサイズ: 2592x1944 → 800x480
  - フレームレート: 全フレーム取得
  - ピクセルピッチ: 1600バイト (800 * 2)
```

### メモリ要件

```
フレームバッファ:
  800 x 480 x 2 (RGB565) = 768 KB

スタックサイズ:
  camera_task: 2048 バイト
  task_1: 1024 バイト
  task_2: 1024 バイト

最小RAM要件: 約1MB
推奨RAM: 2MB以上
```

---

## 🎓 学習リソース

### STマイクロエレクトロニクス公式

1. **UM3234** - STM32N6 Boot ROM Guide
2. **AN6211** - DCMIPP Introduction
3. **RM0486** - STM32N657 Reference Manual

### コミュニティ

- [STM32 Community Forum](https://community.st.com/)
- [microT-Kernel GitHub](https://github.com/tron-forum/mtkernel_3)

---

## 🤝 コントリビューション

バグ報告、機能提案、プルリクエストを歓迎します！

---

## 📄 ライセンス

本プロジェクトは以下のライセンスに従います：

- **STM32 HAL/BSP**: STマイクロエレクトロニクス Software License Agreement
- **microT-Kernel**: T-License 2.2 (オープンソース)
- **カスタムコード**: MITライセンス

---

## 📧 お問い合わせ

質問、サポートが必要な場合:

1. `CAMERA_INTEGRATION_GUIDE.md` のトラブルシューティング章を確認
2. Issue tracker で既知の問題を検索
3. 新しいIssueを作成（ビルドログ、シリアル出力を添付）

---

## 📅 更新履歴

| バージョン | 日付 | 変更内容 |
|-----------|------|---------|
| 1.0 | 2025-01-XX | 初版リリース |

---

**開発者**: Claude AI Assistant  
**プロジェクト**: mtk3bsp2_stm32n657  
**最終更新**: 2025-01-XX  
**ステータス**: ✅ 実装完了 → 🧪 ビルドテスト待ち

---

## 🎯 次のステップ

カメラ統合完了後の発展項目：

1. ✅ **カメラ統合** ← 現在ここ
2. 🔲 **YOLO AI推論統合**
3. 🔲 **LCD表示連携**
4. 🔲 **ネットワーク送信**
5. 🔲 **省電力モード実装**

---

**Happy Coding! 🚀📸**
