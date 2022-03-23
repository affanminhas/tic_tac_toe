class WinPlayer {
  String _playerName;

  String get playerName => _playerName;   // --- Getter for player

  set playerName(String value) {  // --- Setter for player
    _playerName = value;
  }

  WinPlayer(this._playerName);  // --- Constructor
}