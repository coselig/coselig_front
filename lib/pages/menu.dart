import 'package:flutter/material.dart';

// 1. [Data Layer] 資料區
const String brandName = '2025照明控制指南';
const String demoBoxText =
    '從流程、合理費用、施工項目、到挑選燈具，\n'
    '設計師沒告訴你的自救關鍵';
const String brandPhilosophy =
    '室內裝修角度出發，配置合適的照明、做最合適的整合。\n\n'
    '光悅科技以照明設計為基礎，打造使用者專屬的智能家庭整合方案，'
    '智能不僅只是便利，更多是對於高品質生活的探索。\n\n'
    '從前期設計、規劃到落成，過程充分的溝通、適度的調整，'
    '在照明與智能交織下，家的氛圍隨情境流動。'
    '每一次歸來，總會伴隨那一份堅定以及可靠。\n\n'
    '一切源自使用需求，全屋智能不一定好。\n\n'
    '理想居家生活，不一定一開始就擺放齊全的設備、擁'
    '有一次到位的智能整合。\n\n'
    '回到生活本質，每個燈具迴'
    '路配置、燈點設計，以及設備建議、採購，最後進行'
    '軟體設定、安裝，繁複的每一步都是為了貼合使用者'
    '日常的需要、實現每一位使用者理想的居家生活。';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // ==========================================
              // 修改重點在這裡：
              // 我們把原本普通的 Text 換成我們自己做的 HighlightTitle
              // ==========================================
              const HighlightTitle(
                text: brandName, 
                color: Color(0xFFCDE2E5), // 這裡可以換成你想要的螢光筆顏色 (淡藍綠色)
              ),

              const SizedBox(height: 20),

              const Text(
                demoBoxText,
                style: TextStyle(
                  fontSize: 30, // 稍微調整了一下大小，讓它跟標題有層次
                  color: Color.fromARGB(227, 0, 6, 9),
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 20),
              
              const Text(
                brandPhilosophy,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.6,
                ),
                textAlign: TextAlign.justify, // 左右對齊
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// =======================================================
// [Custom Widget] 自定義元件：螢光筆標題
// 這就像你自己做了一個專用的「標籤機模組」
// =======================================================
class HighlightTitle extends StatelessWidget {
  final String text;
  final Color color;

  const HighlightTitle({
    super.key,
    required this.text,
    this.color = Colors.yellow, // 預設黃色
  });

  @override
  Widget build(BuildContext context) {
    // 使用 Stack (堆疊) 來做層次效果
    return Stack(
      children: [
        // 1. 底層：色塊
        Positioned(
          bottom: 0, // 距離底部 5px (可以微調)
          left: 0,
          right: 0,
          child: Container(
            height: 14, // 色塊高度 (約字體的 40%)
            color: const Color.fromARGB(255, 148, 194, 216),
          ),
        ),
        
        // 2. 上層：文字
        // 這裡加上 Padding 是為了讓色塊左右稍微突出一點點，看起來比較活潑(可選)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 46, 86, 105),
              letterSpacing: 2.0,
              height: 1.5, // 設定行高 1.0 很重要，確保色塊對齊準確
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}