import 'package:flutter/material.dart';
import 'login_page.dart';
import '../models/tweet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  get navigationBar => null;

  // Affiche une icône + un compteur (affichage seul)
  Widget _buildTweetAction(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white54),
        const SizedBox(width: 4),
        Text(count, style: const TextStyle(color: Colors.white54)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Image.asset('assets/x-logo.png', height: 30),
          leading: Center(
            child: CircleAvatar(
              radius: 16,
              foregroundImage: AssetImage('assets/avatar-icon.png'), // ✅ AssetImage
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                overlayColor: Colors.white54,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.blue,
            overlayColor: WidgetStatePropertyAll(Color.fromARGB(19, 160, 160, 160)),
            splashBorderRadius: BorderRadius.all(Radius.circular(30)),
            tabs: [
              Tab(text: 'Pour vous'),
              Tab(text: 'Abonnements'),
            ],
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.white54,
            dividerColor: Colors.white54,
            dividerHeight: 0.5,
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: Tweet.sampleTweets.length,
              itemBuilder: (context, index) {
                final tweet = Tweet.sampleTweets[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white24, width: 0.5),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(tweet.profilePictureUrl),
                    ),
                    title: Row(
                      children: [
                        Text(tweet.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 4),
                        if (tweet.verified)
                          const Icon(Icons.check_circle, color: Colors.blue, size: 16),
                        const SizedBox(width: 4),
                        Text(tweet.handle, style: const TextStyle(color: Colors.white54)),
                        const SizedBox(width: 4),
                        Text(' ⦿  ${tweet.time}', style: const TextStyle(color: Colors.white54)),
                        Spacer(),
                        Text('•••', style: const TextStyle(color: Colors.white54)),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(tweet.content, style: const TextStyle(color: Colors.white)),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTweetAction(Icons.comment, tweet.comments),
                            _buildTweetAction(Icons.repeat_on, tweet.retweets),
                            _buildTweetAction(Icons.favorite_border, tweet.likes),
                            _buildTweetAction(Icons.remove_red_eye_outlined, tweet.views),
                            _buildTweetAction(Icons.share, ''),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Center(
              child: Text('Abonnements', style: const TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // nécessaire avec 5 items
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Communautés'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: 'Messages'),
          ],
        ),
      ),
    );
  }
}