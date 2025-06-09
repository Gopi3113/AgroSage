% Prolog Knowledge Base for AgroSage

% Crop suitability based on soil type, season, and water availability
crop_suitability(loamy, summer, high, wheat).
crop_suitability(loamy, summer, medium, maize).
crop_suitability(loamy, summer, low, millet).
crop_suitability(loamy, winter, high, barley).
crop_suitability(loamy, winter, medium, wheat).
crop_suitability(loamy, winter, low, oats).
crop_suitability(loamy, rainy, high, rice).
crop_suitability(loamy, rainy, medium, paddy).
crop_suitability(loamy, rainy, low, sorghum).

crop_suitability(clayey, summer, high, maize).
crop_suitability(clayey, summer, medium, millet).
crop_suitability(clayey, summer, low, sorghum).
crop_suitability(clayey, winter, high, wheat).
crop_suitability(clayey, winter, medium, barley).
crop_suitability(clayey, winter, low, oats).
crop_suitability(clayey, rainy, high, rice).
crop_suitability(clayey, rainy, medium, paddy).
crop_suitability(clayey, rainy, low, millet).

crop_suitability(sandy, summer, high, maize).
crop_suitability(sandy, summer, medium, millet).
crop_suitability(sandy, summer, low, sorghum).
crop_suitability(sandy, winter, high, barley).
crop_suitability(sandy, winter, medium, wheat).
crop_suitability(sandy, winter, low, oats).
crop_suitability(sandy, rainy, high, rice).
crop_suitability(sandy, rainy, medium, paddy).
crop_suitability(sandy, rainy, low, millet).

crop_suitability(black, summer, high, sunflower).
crop_suitability(black, summer, medium, maize).
crop_suitability(black, summer, low, sorghum).
crop_suitability(black, winter, high, wheat).
crop_suitability(black, winter, medium, barley).
crop_suitability(black, winter, low, oats).
crop_suitability(black, rainy, high, cotton).
crop_suitability(black, rainy, medium, paddy).
crop_suitability(black, rainy, low, millet).

crop_suitability(alluvial, summer, high, maize).
crop_suitability(alluvial, summer, medium, millet).
crop_suitability(alluvial, summer, low, sorghum).
crop_suitability(alluvial, winter, high, wheat).
crop_suitability(alluvial, winter, medium, barley).
crop_suitability(alluvial, winter, low, oats).
crop_suitability(alluvial, rainy, high, rice).
crop_suitability(alluvial, rainy, medium, paddy).
crop_suitability(alluvial, rainy, low, millet).

% Crop information (Difficulty, Usefulness, Water Requirement)
crop_info(wheat, [medium, grain_production, medium]).
crop_info(rice, [high, food_grain, high]).
crop_info(maize, [medium, food_grain, medium]).
crop_info(cotton, [high, fiber_production, low]).
crop_info(paddy, [medium, food_grain, high]).
crop_info(barley, [low, grain_production, low]).
crop_info(millet, [low, food_grain, low]).
crop_info(sorghum, [medium, food_grain, low]).
crop_info(sunflower, [medium, oil_production, medium]).

% Fertilizer suggestion for each crop
fertilizer_suggestion(wheat, 'NPK 10:26:26 , Phosphorus & Potassium-rich Fertilizer').
fertilizer_suggestion(rice, 'NPK 20:10:10 Nitrogen-rich Balanced Fertilizer').
fertilizer_suggestion(maize, 'NPK 15:15:15 Balanced Fertilizer').
fertilizer_suggestion(cotton, 'NPK 30:20:20 High Nitrogen Fertilizer').
fertilizer_suggestion(paddy, 'NPK 15:30:15 High Phosphorus Fertilizer').
fertilizer_suggestion(barley, 'NPK 12:32:16 High Phosphorus Fertilizer').
fertilizer_suggestion(millet, 'NPK 10:20:10 Low Nitrogen Fertilizer').
fertilizer_suggestion(sorghum, 'NPK 15:15:15 Balanced Fertilizer').
fertilizer_suggestion(sunflower, 'NPK 20:20:0 High Potassium Fertilizer').

% Web version of suggestion with additional checks
suggest_web(Soil, Season, WaterAvailability) :-
    crop_suitability(Soil, Season, WaterAvailability, Crop),
    crop_info(Crop, [Difficulty, Usefulness, WaterNeed]),
    fertilizer_suggestion(Crop, Fertilizer),
    format('✅ Recommended Crop: ~w~n', [Crop]),
    format('📊 Difficulty Level: ~w~n', [Difficulty]),
    format('🎯 Usefulness: ~w~n', [Usefulness]),
    format('💧 Crop Water Requirement: ~w~n', [WaterNeed]),
    format('💧 Your Water Availability: ~w~n', [WaterAvailability]),
    format('🌦 Season: ~w~n', [Season]),
    format('🧪 Suggested Fertilizer: ~w~n', [Fertilizer]).

% PDF version without emojis
suggest_pdf(Soil, Season, WaterAvailability) :-
    crop_suitability(Soil, Season, WaterAvailability, Crop),
    crop_info(Crop, [Difficulty, Usefulness, WaterNeed]),
    fertilizer_suggestion(Crop, Fertilizer),
    format('1. Recommended Crop: ~w~n', [Crop]),
    format('2. Difficulty Level: ~w~n', [Difficulty]),
    format('3. Usefulness: ~w~n', [Usefulness]),
    format('4. Crop Water Requirement: ~w~n', [WaterNeed]),
    format('5. Your Water Availability: ~w~n', [WaterAvailability]),
    format('6. Season: ~w~n', [Season]),
    format('7. Suggested Fertilizer: ~w~n', [Fertilizer]).
