import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/coffee_model.dart';

class CoffeeCard extends StatefulWidget {
  final CoffeeModel coffee;

  const CoffeeCard({required this.coffee});

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  bool _isHovered = false;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      widget.coffee.imageAsset,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child:
                          _isHovered
                              ? Text(
                                widget.coffee.description,
                                key: ValueKey('desc'),
                                style: GoogleFonts.robotoMono(
                                  fontSize: 13,
                                  color: Colors.white60,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              )
                              : Align(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.coffee.name,
                                  key: ValueKey('name'),
                                  style: GoogleFonts.robotoMono(fontSize: 20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 12,
              right: 15,
              child: GestureDetector(
                onTap: () {
                  setState(() => _isFavorite = !_isFavorite);
                },
                child: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.redAccent : Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
