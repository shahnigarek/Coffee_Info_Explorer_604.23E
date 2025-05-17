import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/coffee_model.dart';

class CoffeeDetailPage extends StatefulWidget {
  final CoffeeModel coffee;

  const CoffeeDetailPage({Key? key, required this.coffee}) : super(key: key);

  @override
  CoffeeDetailPageState createState() => CoffeeDetailPageState();
}

class CoffeeDetailPageState extends State<CoffeeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.local_cafe, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.coffee.name,
              style: GoogleFonts.lora(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3E2B1F), Color(0xFFF1D1A6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            image: DecorationImage(
              image: AssetImage('assets/coffee_texture.png'),
              fit: BoxFit.cover,
              opacity: 0.1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.coffee.name,
                    style: GoogleFonts.pacifico(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.coffee.image),
                                fit: BoxFit.contain,
                                alignment: Alignment.topCenter,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                  backgroundColor: Colors.brown,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.home, size: 30, color: Colors.white),
                                label: Text(
                                  "Back to Home",
                                  style: GoogleFonts.lora(fontSize: 16, color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 20),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: _toggleFavorite,
                                icon: Icon(
                                  widget.coffee.isFavorite ? Icons.favorite : Icons.favorite_border,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  widget.coffee.isFavorite ? "Unfavorite" : "Favorite",
                                  style: GoogleFonts.lora(fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xCCFFFFFF),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.coffee.description2,
                              style: GoogleFonts.lora(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 20),
                            _buildDetailText('Origin:', widget.coffee.origin),
                            _buildDetailText('Brewing Method:', widget.coffee.brewingMethod),
                            _buildDetailText('Taste Profile:', widget.coffee.tasteProfile),
                            _buildDetailText('Caffeine Level:', widget.coffee.caffeineLevel),
                            _buildDetailText('Fun Fact:', widget.coffee.funFact),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      widget.coffee.isFavorite = !widget.coffee.isFavorite;
    });
  }

  Widget _buildDetailText(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0x193E2723),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.lora(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3E2B1F),
              ),
            ),
            SizedBox(height: 8),
            Text(
              detail,
              style: GoogleFonts.lora(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
