

test = []spawn {
	waitUntil {
		_rating = rating player;

		if (_rating != 0)then {
			if (_rating < 0)then {
				player addRating -_rating;
			}else{
				player addRating -_rating;
			};
		};
		sleep 1;
		
		false
	};
};