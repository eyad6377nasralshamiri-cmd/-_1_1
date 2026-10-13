
import 'package:flutter/material.dart';

void main() {
  runApp(const MasabaqaApp());
}

const navy = Color(0xFF142747);
const blue = Color(0xFF2864DC);
const gold = Color(0xFFF2B84B);

class MasabaqaApp extends StatelessWidget {
  const MasabaqaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مسابقة',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7FC),
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class Question {
  final String text;
  final List<String> choices;
  final int answer;

  const Question(this.text, this.choices, this.answer);
}

const questions = <Question>[
  Question(
    'ما عاصمة اليمن؟',
    ['عدن', 'صنعاء', 'تعز', 'إب'],
    1,
  ),
  Question(
    'كم عدد أيام الأسبوع؟',
    ['خمسة', 'ستة', 'سبعة', 'ثمانية'],
    2,
  ),
  Question(
    'ما ناتج 8 × 7؟',
    ['54', '56', '64', '48'],
    1,
  ),
  Question(
    'أي الكواكب أقرب إلى الشمس؟',
    ['الأرض', 'المريخ', 'عطارد', 'زحل'],
    2,
  ),
  Question(
    'ما الغاز الذي يحتاجه الإنسان للتنفس؟',
    ['الأكسجين', 'الهيليوم', 'الهيدروجين', 'النيتروجين'],
    0,
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.emoji_events_rounded,
                      color: gold,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مسابقة',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: navy,
                        ),
                      ),
                      Text(
                        'منصة تعليمية تفاعلية',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [navy, blue],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.school_rounded, color: gold, size: 38),
                    SizedBox(height: 16),
                    Text(
                      'تعلّم، نافس، وحقّق النجاح!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'اختبر معلوماتك في مختلف المواد والمجالات '
                      'من خلال مسابقات تعليمية ممتعة.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'ابدأ الآن',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),
              const SizedBox(height: 14),
              _HomeCard(
                icon: Icons.person_rounded,
                title: 'دخول الطالب',
                subtitle: 'ابدأ المسابقة واختبر معلوماتك',
                color: blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const StudentPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              _HomeCard(
                icon: Icons.dashboard_rounded,
                title: 'لوحة الأستاذ',
                subtitle: 'عرض لوحة التحكم والإحصائيات التجريبية',
                color: const Color(0xFF16866B),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TeacherPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'مسابقة • طريقك نحو المعرفة والنجاح',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _HomeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: color.withAlpha(25),
          child: Icon(icon, color: color, size: 29),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.arrow_back_ios_new_rounded, size: 17),
        onTap: onTap,
      ),
    );
  }
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final nameController = TextEditingController();
  String? studentName;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void startQuiz() {
    final name = nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى كتابة اسم الطالب أولاً')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizPage(studentName: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('دخول الطالب')),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const Icon(Icons.account_circle_rounded, size: 90, color: blue),
          const SizedBox(height: 20),
          const Text(
            'أهلاً بك أيها الطالب!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: navy,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'أدخل اسمك للبدء في المسابقة التجريبية.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'اسم الطالب',
              prefixIcon: const Icon(Icons.person_outline),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 18),
          FilledButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('ابدأ المسابقة'),
            style: FilledButton.styleFrom(
              backgroundColor: blue,
              padding: const EdgeInsets.all(17),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String studentName;

  const QuizPage({super.key, required this.studentName});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int current = 0;
  int score = 0;
  int? selected;
  bool finished = false;

  void nextQuestion() {
    if (selected == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('اختر إجابة أولاً')),
      );
      return;
    }

    if (selected == questions[current].answer) {
      score++;
    }

    if (current == questions.length - 1) {
      setState(() => finished = true);
    } else {
      setState(() {
        current++;
        selected = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المسابقة التعليمية')),
      body: finished ? resultView() : questionView(),
    );
  }

  Widget questionView() {
    final q = questions[current];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'الطالب: ${widget.studentName}',
          style: const TextStyle(color: Colors.blueGrey),
        ),
        const SizedBox(height: 14),
        LinearProgressIndicator(
          value: (current + 1) / questions.length,
          minHeight: 8,
          borderRadius: BorderRadius.circular(8),
        ),
        const SizedBox(height: 12),
        Text(
          'السؤال ${current + 1} من ${questions.length}',
          style: const TextStyle(
            color: blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          q.text,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        const SizedBox(height: 20),
        ...List.generate(q.choices.length, (i) {
          final isSelected = selected == i;
          return Card(
            elevation: 0,
            color: isSelected ? const Color(0xFFDCE8FF) : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(
                color: isSelected ? blue : Colors.black12,
              ),
            ),
            child: RadioListTile<int>(
              value: i,
              groupValue: selected,
              activeColor: blue,
              title: Text(q.choices[i]),
              onChanged: (value) => setState(() => selected = value),
            ),
          );
        }),
        const SizedBox(height: 18),
        FilledButton(
          onPressed: nextQuestion,
          style: FilledButton.styleFrom(
            backgroundColor: blue,
            padding: const EdgeInsets.all(16),
          ),
          child: Text(
            current == questions.length - 1
                ? 'إنهاء المسابقة'
                : 'السؤال التالي',
          ),
        ),
      ],
    );
  }

  Widget resultView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.emoji_events_rounded, size: 90, color: gold),
            const SizedBox(height: 18),
            const Text(
              'انتهت المسابقة!',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
            const SizedBox(height: 12),
            Text('الطالب: ${widget.studentName}'),
            const SizedBox(height: 12),
            Text(
              'نتيجتك: $score من ${questions.length}',
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: blue,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('العودة للرئيسية'),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('لوحة الأستاذ')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'نظرة عامة',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: navy,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'هذه بيانات تجريبية للعرض وليست إحصائيات حقيقية.',
            style: TextStyle(color: Colors.blueGrey),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'الأسئلة',
                  value: '5',
                  icon: Icons.quiz_rounded,
                  color: blue,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'المشاركون',
                  value: '0',
                  icon: Icons.people_rounded,
                  color: Color(0xFF16866B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Card(
            child: ListTile(
              leading: Icon(Icons.info_outline, color: blue),
              title: Text('الإصدار التجريبي'),
              subtitle: Text(
                'إدارة الأسئلة وحفظ النتائج المشتركة '
                'ستحتاج إلى تطوير قاعدة بيانات في مرحلة لاحقة.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}