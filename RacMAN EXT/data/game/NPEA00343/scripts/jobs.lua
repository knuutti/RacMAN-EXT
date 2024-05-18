function load_job_helper(job_id, cp_id, load_mode, map)
	sly3_set_map(map)	

	-- Proper reload if loading the job checkpoint first time
	if cp_id ~= Memory.ReadInt(0x5EB490) then load_mode = 134 end

	Memory.WriteInt(0x5EB488, job_id)
	Memory.WriteInt(0x5EB48C, cp_id)
	Memory.WriteInt(0x5EB490, cp_id)
	Memory.WriteInt(0x78D2C4, load_mode)
	Memory.WriteInt(0x78D2C0, 1)
end

function sly3_load_job(index)
	-- Loads a job based on the selection in the dropdown menu

	local name = Trainer.GetControlByName('jobSelectDropDown').Items[index] 
	-- using names instead of indices in case the order or contents are later changed

	-- If you change the names, remember to also change the name in trainer.json!
	if		name == "The Cooper Vault"				then load_job_helper(1798, 1799, 134, "Y$KFm_ext")
	elseif	name == " [TCV] Cave"					then load_job_helper(1798, 1800, 4, "Y$KFm_ext")
	elseif	name == " [TCV] Top"					then load_job_helper(1798, 1801, 4, "Y$KFm_ext")
	elseif	name == " [TCV] Chase"					then load_job_helper(1798, 1803, 4, "Y$KFm_ext")
	elseif	name == " [TCV] End"					then load_job_helper(1798, 1804, 4, "Y$KFm_ext")
	elseif	name == "Police HQ"						then load_job_helper(2117, 2118, 134, "Y$KFv_ext")
	elseif	name == " [PHQ] Exit the vent"			then load_job_helper(2117, 2123, 4, "Y$KFv_interpol")
	elseif	name == " [PHQ] Crawl to the key"		then load_job_helper(2117, 2131, 4, "Y$KFv_interpol")
	elseif	name == " [PHQ] Crawl back to Dimitri"	then load_job_helper(2117, 2138, 4, "Y$KFv_interpol")
	elseif	name == " [PHQ] Pick the lock"			then load_job_helper(2117, 2144, 4, "Y$KFv_interpol")
	elseif	name == " [PHQ] Carmelita chase"		then load_job_helper(2117, 2154, 4, "Y$KFv_ext")
	elseif	name == "Octavio Snap"					then load_job_helper(2261, 2268, 134, "Y$KFv_ext")
	elseif	name == " [OS] After 1st picture"		then load_job_helper(2261, 2273, 4, "Y$KFv_ext")
	elseif	name == " [OS] Taking 2nd picture"		then load_job_helper(2261, 2276, 4, "Y$KFv_ext")
	elseif	name == " [OS] After 2nd picture"		then load_job_helper(2261, 2278, 4, "Y$KFv_ext")
	elseif	name == " [OS] Taking 3rd picture"		then load_job_helper(2261, 2281, 4, "Y$KFv_ext")
	elseif	name == " [OS] After 3rd picture"		then load_job_helper(2261, 2283, 4, "Y$KFv_ext")
	elseif	name == " [OS] Taking 4th picture"		then load_job_helper(2261, 2287, 4, "Y$KFv_ext")
	elseif	name == " [OS] After 4th picture"		then load_job_helper(2261, 2291, 4, "Y$KFv_ext")
	elseif	name == " [OS] Ferris Wheel"			then load_job_helper(2261, 2297, 4, "Y$KFv_ext")
	elseif	name == "Into the Depths"				then load_job_helper(2314, 2315, 134, "Y$KFv_ext")
	elseif	name == " [ItD] Enter the Opera House"	then load_job_helper(2314, 1811, 4, "Y$KFv_gauntlet")
	elseif	name == " [ItD] Canal"					then load_job_helper(2314, 2327, 4, "Y$KFv_gauntlet")
	elseif	name == " [ItD] First laser door"		then load_job_helper(2314, 2335, 4, "Y$KFv_gauntlet")
	elseif	name == " [ItD] Computer Room"			then load_job_helper(2314, 2351, 4, "Y$KFv_gauntlet")
	elseif	name == "Canal Chase"					then load_job_helper(2360, 2362, 134, "Y$KFv_ext")
	elseif	name == " [CC] Start of the chase"		then load_job_helper(2360, 1805, 4, "Y$KFv_canal")
	elseif	name == "Turf War!"						then load_job_helper(2170, 2172, 134, "Y$KFv_ext")
	elseif	name == " [TW] Wave #1"					then load_job_helper(2170, 2182, 4, "Y$KFv_ext")
	elseif	name == " [TW] Wave #2"					then load_job_helper(2170, 2186, 4, "Y$KFv_ext")
	elseif	name == " [TW] Wave #3"					then load_job_helper(2170, 2190, 4, "Y$KFv_ext")
	elseif	name == " [TW] Wave #4"					then load_job_helper(2170, 2194, 4, "Y$KFv_ext")
	elseif	name == "Tar Ball"						then load_job_helper(2199, 2202, 134, "Y$KFv_ext")
	elseif	name == "Run 'n Bomb"					then load_job_helper(2218, 2223, 134, "Y$KFv_ext")
	elseif	name == " [RnB] After bomb 1"			then load_job_helper(2218, 2229, 4, "Y$KFv_ext")
	elseif	name == " [RnB] Deliever bomb 2"		then load_job_helper(2218, 2232, 4, "Y$KFv_ext")
	elseif	name == " [RnB] Climb the tower"		then load_job_helper(2218, 2237, 4, "Y$KFv_ext")
	elseif	name == " [RnB] Run to the shop"		then load_job_helper(2218, 2241, 4, "Y$KFv_ext")
	elseif	name == " [RnB] Chase Octavio"			then load_job_helper(2218, 2245, 4, "Y$KFv_ext")
	elseif	name == "Guard Duty"					then load_job_helper(2382, 2383, 134, "Y$KFv_ext")
	elseif	name == " [GD] Enter Coffee House #1"	then load_job_helper(2382, 2391, 4, "Y$KFv_apt")
	elseif	name == " [GD] Run to Coffee House #2"	then load_job_helper(2382, 2031, 4, "Y$KFv_ext")
	elseif	name == " [GD] Enter Coffee House #2"	then load_job_helper(2382, 2404, 4, "Y$KFv_apt")
	elseif	name == " [GD] Run to Coffee House #3"	then load_job_helper(2382, 2411, 4, "Y$KFv_ext")
	elseif	name == " [GD] Enter Coffee House #3"	then load_job_helper(2382, 2422, 4, "Y$KFv_apt")
	elseif	name == " [GD] Escape the guards"		then load_job_helper(2382, 2429, 4, "Y$KFv_ext")
	elseif	name == "OP: Tar Be Gone!"				then load_job_helper(2448, 2453, 134, "Y$KFv_ext")
	elseif	name == " [TBG] Enter the Opera House"	then load_job_helper(2448, 2459, 4, "Y$KFv_gauntlet")
	elseif	name == " [TBG] Tar Pump room"			then load_job_helper(2448, 2471, 4, "Y$KFv_gauntlet")
	elseif	name == " [TBG] Opera Minigame"			then load_job_helper(2448, 2486, 4, "Y$KFv_ext")
	elseif	name == " [TBG] Canal Chase"			then load_job_helper(2448, 2505, 4, "Y$KFv_canal")
	elseif	name == " [TBG] Boss fight"				then load_job_helper(2448, 2516, 4, "Y$KFv_ext")
	elseif	name == "Search for the Guru"			then load_job_helper(2605, 2606, 134, "Y$KFo_ext")
	elseif	name == " [SftG] Cave entrance"			then load_job_helper(2605, 2610, 4, "Y$KFo_ext")
	elseif	name == " [SftG] Guru's home"			then load_job_helper(2605, 2615, 4, "Y$KFo_ext")
	elseif	name == "Spelunking"					then load_job_helper(2623, 2624, 134, "Y$KFo_ext")
	elseif	name == " [S] Enter the cave"			then load_job_helper(2623, 2629, 4, "Y$KFo_cave_murray")
	elseif	name == " [S] First piston"				then load_job_helper(2623, 2632, 4, "Y$KFo_cave_murray")
	elseif	name == " [S] Second pistons"			then load_job_helper(2623, 2636, 4, "Y$KFo_cave_murray")
	elseif	name == " [S] Drills"					then load_job_helper(2623, 2640, 4, "Y$KFo_cave_murray")
	elseif	name == " [S] Find the Guru"			then load_job_helper(2623, 2648, 4, "Y$KFo_ext")
	elseif	name == "Dark Caves"					then load_job_helper(2829, 2833, 134, "Y$KFo_ext")
	elseif	name == " [DC] Enter cave #1"			then load_job_helper(2829, 2839, 4, "Y$KFo_cave_a")
	elseif	name == " [DC] Escape cave #1"			then load_job_helper(2829, 2846, 4, "Y$KFo_cave_a")
	elseif	name == " [DC] Find cave #2 entrance"	then load_job_helper(2829, 2850, 4, "Y$KFo_ext")
	elseif	name == " [DC] Enter cave #2"			then load_job_helper(2829, 2852, 4, "Y$KFo_cave_b")
	elseif	name == " [DC] Escape cave #2"			then load_job_helper(2829, 2859, 4, "Y$KFo_cave_b")
	elseif	name == "Big Truck"						then load_job_helper(2722, 2731, 134, "Y$KFo_ext")
	elseif	name == " [BT] Enter Ayer's Rock"		then load_job_helper(2722, 2734, 4, "Y$KFo_quarry")
	elseif	name == " [BT] Phase 1"					then load_job_helper(2722, 2737, 4, "Y$KFo_quarry")
	elseif	name == " [BT] Climb the tower"			then load_job_helper(2722, 2742, 4, "Y$KFo_quarry")
	elseif	name == " [BT] Phase 2"					then load_job_helper(2722, 2742, 4, "Y$KFo_quarry")
	elseif	name == " [BT] Release the scorpions"	then load_job_helper(2722, 2033, 4, "Y$KFo_quarry")
	elseif	name == "Unleash the Guru"				then load_job_helper(2690, 1807, 134, "Y$KFo_ext")
	elseif	name == " [UtG] Find the drills"		then load_job_helper(2690, 2698, 4, "Y$KFo_ext")
	elseif	name == " [UtG] Drills"					then load_job_helper(2690, 2704, 4, "Y$KFo_ext")
	elseif	name == " [UtG] Generator"				then load_job_helper(2690, 2715, 4, "Y$KFo_ext")
	elseif	name == "The Claw"						then load_job_helper(2650, 2654, 134, "Y$KFo_ext")
	elseif	name == " [TC] Phase 1"					then load_job_helper(2650, 2656, 4, "Y$KFo_arena")
	elseif	name == " [TC] Phase 2"					then load_job_helper(2650, 2668, 4, "Y$KFo_arena")
	elseif	name == " [TC] Phase 3"					then load_job_helper(2650, 2678, 4, "Y$KFo_arena")
	elseif	name == "Lemon Rage"					then load_job_helper(2756, 2757, 134, "Y$KFo_ext")
	elseif	name == " [LR] Enter the bar"			then load_job_helper(2756, 2759, 4, "Y$KFo_bar")
	elseif	name == " [LR] Drinking contest"		then load_job_helper(2756, 1806, 4, "Y$KFo_bar")
	elseif	name == " [LR] Bar fight"				then load_job_helper(2756, 2779, 4, "Y$KFo_bar")
	elseif	name == " [LR] Boss fight"				then load_job_helper(2756, 2788, 4, "Y$KFo_bar")
	elseif	name == "Hungry Croc"					then load_job_helper(2804, 2810, 134, "Y$KFo_ext")
	elseif	name == " [HC] Feed the Croc"			then load_job_helper(2804, 2814, 4, "Y$KFo_ext")
	elseif	name == " [HC] Flashlight guard"		then load_job_helper(2804, 2817, 4, "Y$KFo_ext")
	elseif	name == "OP: Moon Crash"				then load_job_helper(2867, 2869, 134, "Y$KFo_ext")
	elseif	name == " [MC] Sleep darts"				then load_job_helper(2867, 2891, 4, "Y$KFo_ext")
	elseif	name == " [MC] Truck"					then load_job_helper(2867, 2925, 4, "Y$KFo_quarry")
	elseif	name == " [MC] Climb"					then load_job_helper(2867, 2934, 4, "Y$KFo_quarry")
	elseif	name == "Hidden Flight Roster"			then load_job_helper(3007, 3009, 134, "Y$KFh_hotel")
	elseif	name == " [HFR] Exit the hotel"			then load_job_helper(3007, 1818, 4, "Y$KFh_hotel")
	elseif	name == " [HFR] Find the castle"		then load_job_helper(3007, 1818, 4, "Y$KFh_ext")
	elseif	name == " [HFR] Castle Climb"			then load_job_helper(3007, 3022, 4, "Y$KFh_ext")
	elseif	name == " [HFR] Reach the hangar"		then load_job_helper(3007, 3031, 4, "Y$KFh_ext")
	elseif	name == " [HFR] Hangar"					then load_job_helper(3007, 3034, 4, "Y$KFh_hangar_b")
	elseif	name == "Frame Team Belgium"			then load_job_helper(3049, 3051, 134, "Y$KFh_ext")
	elseif	name == " [FTB] Find the pilot"			then load_job_helper(3049, 3053, 4, "Y$KFh_hotel")
	elseif	name == " [FTB] Pickpocket"				then load_job_helper(3049, 3058, 4, "Y$KFh_hotel")
	elseif	name == " [FTB] Guru section"			then load_job_helper(3049, 3068, 4, "Y$KFh_ext")
	elseif	name == " [FTB] Sly section"			then load_job_helper(3049, 3075, 4, "Y$KFh_ext")
	elseif	name == "Frame Team Iceland"			then load_job_helper(3085, 3086, 134, "Y$KFh_ext")
	elseif	name == " [FTI] Rowing #1"				then load_job_helper(3085, 3088, 4, "Y$KFh_sewer")
	elseif	name == " [FTI] Platforming #1"			then load_job_helper(3085, 3090, 4, "Y$KFh_sewer")
	elseif	name == " [FTI] Hotel"					then load_job_helper(3085, 3094, 4, "Y$KFh_hotel")
	elseif	name == " [FTI] Platforming #2"			then load_job_helper(3085, 3102, 4, "Y$KFh_sewer")
	elseif	name == " [FTI] Rowing #2"				then load_job_helper(3085, 3104, 4, "Y$KFh_sewer")
	elseif	name == " [FTI] Find the hangar"		then load_job_helper(3085, 3108, 4, "Y$KFh_ext")
	elseif	name == " [FTI] Hangar"					then load_job_helper(3085, 3112, 4, "Y$KFh_hangar_b")
	elseif	name == "Cooper Hangar Defence"			then load_job_helper(3125, 3126, 134, "Y$KFh_ext")
	elseif	name == " [CHD] Muggshot"				then load_job_helper(3125, 3126, 4, "Y$KFh_hangar_a")
	elseif	name == " [CHD] Sewers #1"				then load_job_helper(3125, 3140, 4, "Y$KFh_hangar_a")
	elseif	name == " [CHD] Sewers #2"				then load_job_helper(3125, 3146, 4, "Y$KFh_hangar_a")
	elseif	name == " [CHD] RC Chopper"				then load_job_helper(3125, 3153, 4, "Y$KFh_ext")
	elseif	name == "ACES Semi-finals"				then load_job_helper(3167, 3164, 134, "Y$KFh_ext")
	elseif	name == " [AS] Dogfight"				then load_job_helper(3167, 1808, 4, "Y$KFh_dogfight")
	elseif	name == "Giant Wolf Massacre"			then load_job_helper(3225, 3227, 134, "Y$KFh_ext")
	elseif	name == " [GWM] Guru section"			then load_job_helper(3225, 3235, 4, "Y$KFh_ext")
	elseif	name == "Windmill Firewall"				then load_job_helper(3187, 3193, 134, "Y$KFh_ext")
	elseif	name == " [WF] Hack #1"					then load_job_helper(3187, 3196, 4, "Y$KFh_ext")
	elseif	name == " [WF] Find computer #2"		then load_job_helper(3187, 3201, 4, "Y$KFh_ext")
	elseif	name == " [WF] Hack #2"					then load_job_helper(3187, 3204, 4, "Y$KFh_ext")
	elseif	name == " [WF] Find computer #3"		then load_job_helper(3187, 3209, 4, "Y$KFh_ext")
	elseif	name == " [WF] Hack #3"					then load_job_helper(3187, 3212, 4, "Y$KFh_ext")
	elseif	name == " [WF] Find computer #4"		then load_job_helper(3187, 3216, 4, "Y$KFh_ext")
	elseif	name == " [WF] Hack #4"					then load_job_helper(3187, 3219, 4, "Y$KFh_ext")
	elseif	name == "Beauty and the Beast"			then load_job_helper(3248, 3249, 134, "Y$KFh_ext")
	elseif	name == " [BatB] Find Muggshot"			then load_job_helper(3248, 3249, 4, "Y$KFh_hotel")
	elseif	name == " [BatB] Find Carmelita"		then load_job_helper(3248, 3256, 4, "Y$KFh_ext")
	elseif	name == " [BatB] Muggshot fight"		then load_job_helper(3248, 1809, 4, "Y$KFh_ext")
	elseif	name == "OP: Turbo Dominant Eagle"		then load_job_helper(3281, 3283, 134, "Y$KFh_ext")
	elseif	name == " [TDE] Murray section"			then load_job_helper(3281, 3303, 4, "Y$KFh_ext")
	elseif	name == " [TDE] Dogfight"				then load_job_helper(3281, 3317, 4, "Y$KFh_dogfight")
	elseif	name == " [TDE] Boss fight"				then load_job_helper(3281, 3325, 4, "Y$KFh_dogfight")
	elseif	name == "King of Fire"					then load_job_helper(3403, 3405, 134, "Y$KFc_intro")
	elseif	name == " [KoF] Murray"					then load_job_helper(3403, 3406, 4, "Y$KFc_intro") -- might be unnecessary
	elseif	name == " [KoF] Penelope"				then load_job_helper(3403, 3411, 4, "Y$KFc_intro")
	elseif	name == " [KoF] Sly"					then load_job_helper(3403, 3425, 4, "Y$KFc_intro")
	elseif	name == " [KoF] Bentley"				then load_job_helper(3403, 3433, 4, "Y$KFc_intro")
	elseif	name == " [KoF] Guru"					then load_job_helper(3403, 3442, 4, "Y$KFc_intro")
	elseif	name == " [KoF] Flashback"				then load_job_helper(3403, 3454, 4, "Y$KFc_flashback")
	elseif	name == "Get a Job"						then load_job_helper(3471, 3473, 134, "Y$KFc_ext")
	elseif	name == " [GaJ] Talk to Tsao"			then load_job_helper(3471, 3473, 4, "Y$KFc_hall_b")
	elseif	name == " [GaJ] Picture #1"				then load_job_helper(3471, 3480, 4, "Y$KFc_ext")
	elseif	name == " [GaJ] Picture #2"				then load_job_helper(3471, 3487, 4, "Y$KFc_ext")
	elseif	name == " [GaJ] Picture #3"				then load_job_helper(3471, 3498, 4, "Y$KFc_ext")
	elseif	name == " [GaJ] Pictures of Tsao"		then load_job_helper(3471, 3511, 4, "Y$KFc_hall_b")
	elseif	name == "Tearful Reunion"				then load_job_helper(3531, 3536, 134, "Y$KFc_ext")
	elseif	name == " [TR] Free the van"			then load_job_helper(3531, 3541, 4, "Y$KFc_ext")
	elseif	name == " [TR] Defend Murray #1"		then load_job_helper(3531, 3545, 4, "Y$KFc_ext")
	elseif	name == " [TR] Defend Murray #2"		then load_job_helper(3531, 3550, 4, "Y$KFc_ext")
	elseif	name == "Grapple-Cam Break-in"			then load_job_helper(3562, 3565, 134, "Y$KFc_ext")
	elseif	name == " [GCB] Steal the keys"			then load_job_helper(3562, 3570, 4, "Y$KFc_ext")
	elseif	name == " [GCB] Exchange the keys"		then load_job_helper(3562, 3576, 4, "Y$KFc_ext")
	elseif	name == " [GCB] Break in the building"	then load_job_helper(3562, 3580, 4, "Y$KFc_ext")
	elseif	name == " [GCB] Lure #1"				then load_job_helper(3562, 3584, 4, "Y$KFc_hall_a")
	elseif	name == " [GCB] Lure #2"				then load_job_helper(3562, 3590, 4, "Y$KFc_hall_a")
	elseif	name == " [GCB] Find the computer"		then load_job_helper(3562, 3595, 4, "Y$KFc_hall_a")
	elseif	name == " [GCB] Hack"					then load_job_helper(3562, 3600, 4, "Y$KFc_hall_a")
	elseif	name == "Laptop Retrieval"				then load_job_helper(3606, 3607, 134, "Y$KFc_ext")
	elseif	name == " [LR] Find the computer"		then load_job_helper(3606, 3609, 4, "Y$KFc_hall_b")
	elseif	name == " [LR] Hack"					then load_job_helper(3606, 3613, 4, "Y$KFc_hall_b")
	elseif	name == " [LR] Guru section"			then load_job_helper(3606, 3618, 4, "Y$KFc_ext")
	elseif	name == " [LR] Tsao #1"					then load_job_helper(3606, 1810, 4, "Y$KFc_forest")
	elseif	name == " [LR] Tsao #2"					then load_job_helper(3606, 3639, 4, "Y$KFc_forest")
	elseif	name == "Vampiric Demise"				then load_job_helper(3651, 3654, 134, "Y$KFc_ext")
	elseif	name == " [VD] Panda King's house"		then load_job_helper(3651, 3654, 4, "Y$KFc_apt")
	elseif	name == " [VD] Tutorial"				then load_job_helper(3651, 3662, 4, "Y$KFc_ext")
	elseif	name == " [VD] Go to safe #2"			then load_job_helper(3651, 3673, 4, "Y$KFc_ext")
	elseif	name == " [VD] Defend Sly #1"			then load_job_helper(3651, 3675, 4, "Y$KFc_ext")
	elseif	name == " [VD] Go to safe #3"			then load_job_helper(3651, 3679, 4, "Y$KFc_ext")
	elseif	name == " [VD] Defend Sly #2"			then load_job_helper(3651, 3681, 4, "Y$KFc_ext")
	elseif	name == " [VD] Find the gravestone"		then load_job_helper(3651, 3685, 4, "Y$KFc_ext")
	elseif	name == " [VD] Destroy the gravestone"	then load_job_helper(3651, 3689, 4, "Y$KFc_ext")
	elseif	name == "Down the Line"					then load_job_helper(3693, 3694, 134, "Y$KFc_ext")
	elseif	name == " [DtL] RC section"				then load_job_helper(3693, 3701, 4, "Y$KFc_ext")
	elseif	name == "A Battery of Peril"			then load_job_helper(3705, 3706, 134, "Y$KFc_ext")
	elseif	name == " [ABoP] Carmelita"				then load_job_helper(3705, 3709, 4, "Y$KFc_ext")
	elseif	name == " [ABoP] Stabilize the battery"	then load_job_helper(3705, 3718, 4, "Y$KFc_ext")
	elseif	name == "OP: Wedding Crasher"			then load_job_helper(3733, 3734, 134, "Y$KFc_ext")
	elseif	name == " [WC] Open the door"			then load_job_helper(3733, 3735, 4, "Y$KFc_tilt_hall")
	elseif	name == " [WC] Reach the computer"		then load_job_helper(3733, 3737, 4, "Y$KFc_tilt_hall")
	elseif	name == " [WC] Destroy alarms"			then load_job_helper(3733, 3742, 4, "Y$KFc_tilt_hall")
	elseif	name == " [WC] Open the trapdoor"		then load_job_helper(3733, 3779, 4, "Y$KFc_tilt_hall")
	elseif	name == " [WC] Go to the palace"		then load_job_helper(3733, 3782, 4, "Y$KFc_ext")
	elseif	name == " [WC] Protect vases"			then load_job_helper(3733, 3787, 4, "Y$KFc_hall_b")
	elseif	name == " [WC] Lure Carmelita"			then load_job_helper(3733, 3794, 4, "Y$KFc_ext")
	elseif	name == " [WC] Dragon fight"			then load_job_helper(3733, 3807, 4, "Y$KFc_ext")
	elseif	name == "The Talk of Pirates"			then load_job_helper(3867, 3871, 134, "Y$KFp_ext")
	elseif	name == " [TToP] Stone-Jake"			then load_job_helper(3867, 3875, 4, "Y$KFp_ext")
	elseif	name == " [TToP] Find the loutenant"	then load_job_helper(3867, 3882, 4, "Y$KFp_ext")
	elseif	name == " [TToP] Steal the bootleg"		then load_job_helper(3867, 3884, 4, "Y$KFp_ext")
	elseif	name == " [TToP] Find Ned"				then load_job_helper(3867, 3891, 4, "Y$KFp_ext")
	elseif	name == " [TToP] Chase Ned"				then load_job_helper(3867, 3895, 4, "Y$KFp_ext")
	elseif	name == " [TToP] Return to Pete"		then load_job_helper(3867, 3907, 4, "Y$KFp_ext")
	elseif	name == " [TToP] Vinegar Talk"			then load_job_helper(3867, 3911, 4, "Y$KFp_ext")
	elseif	name == "Dynamic Duo"					then load_job_helper(3926, 3927, 134, "Y$KFp_ext")
	elseif	name == " [DD] Go to Skull Keep"		then load_job_helper(3926, 3944, 4, "Y$KFp_ext")
	elseif	name == " [DD] Floating boxes"			then load_job_helper(3926, 3950, 4, "Y$KFp_ext")
	elseif	name == " [DD] Beat the guards"			then load_job_helper(3926, 3957, 4, "Y$KFp_ext")
	elseif	name == " [DD] Lure Penelope #1"		then load_job_helper(3926, 3977, 4, "Y$KFp_ext")
	elseif	name == " [DD] Lure Penelope #2"		then load_job_helper(3926, 3982, 4, "Y$KFp_ext")
	elseif	name == " [DD] Lure Penelope #3"		then load_job_helper(3926, 3994, 4, "Y$KFp_ext")
	elseif	name == "Jollyboat of Destruction"		then load_job_helper(4055, 4056, 134, "Y$KFp_ext")
	elseif	name == " [JoD] Harbor patrol"			then load_job_helper(4055, 4068, 4, "Y$KFp_ext")
	elseif	name == " [JoD] Cutter"					then load_job_helper(4055, 4079, 4, "Y$KFp_ext")
	elseif	name == "X Marks the Spot"				then load_job_helper(4009, 4011, 134, "Y$KFp_ext")
	elseif	name == " [XMtS] Row to the ship"		then load_job_helper(4009, 4015, 4, "Y$KFp_ext")
	elseif	name == " [XMtS] Beat the guards"		then load_job_helper(4009, 4019, 4, "Y$KFp_ext")
	elseif	name == " [XMtS] Escape the bay"		then load_job_helper(4009, 4023, 4, "Y$KFp_ext")
	elseif	name == " [XMtS] Sail to Dagger Isle"	then load_job_helper(4009, 4030, 4, "Y$KFp_at_sea")
	elseif	name == " [XMtS] Sink the ship"			then load_job_helper(4009, 4032, 4, "Y$KFp_at_sea")
	elseif	name == " [XMtS] Dagger Isle"			then load_job_helper(4009, 4040, 4, "Y$KFp_island_map")
	elseif	name == " [XMtS] Statue"				then load_job_helper(4009, 4042, 4, "Y$KFp_island_map")
	elseif	name == " [XMtS] Dig up the chest"		then load_job_helper(4009, 2040, 4, "Y$KFp_island_map")
	elseif	name == "Crusher from the Depths"		then load_job_helper(4088, 4091, 134, "Y$KFp_at_sea")
	elseif	name == " [CftD] Shoot Crusher #1"		then load_job_helper(4088, 4097, 4, "Y$KFp_at_sea")
	elseif	name == " [CftD] Shoot the tentacles"	then load_job_helper(4088, 4101, 4, "Y$KFp_at_sea")
	elseif	name == " [CftD] Shoot Crusher #2"		then load_job_helper(4088, 4105, 4, "Y$KFp_at_sea")
	elseif	name == " [CftD] Cannons"				then load_job_helper(4088, 4109, 4, "Y$KFp_at_sea")
	elseif	name == "Deep Sea Danger"				then load_job_helper(4117, 4118, 134, "Y$KFp_at_sea")
	elseif	name == " [DSD] Underwater"				then load_job_helper(4117, 4123, 4, "Y$KFp_dive")
	elseif	name == " [DSD] Collars"				then load_job_helper(4117, 4125, 4, "Y$KFp_dive")
	elseif	name == " [DSD] Fish"					then load_job_helper(4117, 4128, 4, "Y$KFp_dive")
	elseif	name == " [DSD] Hammersharks"			then load_job_helper(4117, 4132, 4, "Y$KFp_dive")
	elseif	name == "Battle on the High Seas"		then load_job_helper(4136, 4137, 134, "Y$KFp_at_sea")
	elseif	name == " [BotHS] Sail to fight #2"		then load_job_helper(4136, 4141, 4, "Y$KFp_at_sea")
	elseif	name == " [BotHS] Fight #2"				then load_job_helper(4136, 4145, 4, "Y$KFp_at_sea")
	elseif	name == " [BotHS] Sail to fight #3"		then load_job_helper(4136, 4149, 4, "Y$KFp_at_sea")
	elseif	name == " [BotHS] Fight #3"				then load_job_helper(4136, 4153, 4, "Y$KFp_at_sea")
	elseif	name == "OP: Reverse Double-Cross"		then load_job_helper(4161, 4163, 134, "Y$KFp_ext")
	elseif	name == " [RDC] Insult LefWee"			then load_job_helper(4161, 4166, 4, "Y$KFp_ext")
	elseif	name == " [RDC] Escape the ship"		then load_job_helper(4161, 4180, 4, "Y$KFp_ext")
	elseif	name == " [RDC] Skull Keep"				then load_job_helper(4161, 4185, 4, "Y$KFp_ext")
	elseif	name == " [RDC] Crusher"				then load_job_helper(4161, 4192, 4, "Y$KFp_ext")
	elseif	name == " [RDC] Boss fight"				then load_job_helper(4161, 4202, 4, "Y$KFp_ext")
	elseif	name == "Carmelita to the Rescue"		then load_job_helper(4342, 1842, 134, "Y$KFm_ext")
	elseif	name == " [CttR] Talk with Dr. M"		then load_job_helper(4342, 4382, 4, "Y$KFm_ext")
	elseif	name == "A Deadly Bite"					then load_job_helper(4384, 1843, 134, "Y$KFm_ext")
	elseif	name == " [ADB] Sharks #2"				then load_job_helper(4384, 4396, 4, "Y$KFm_ext")
	elseif	name == " [ADB] Sharks #3"				then load_job_helper(4384, 4400, 4, "Y$KFm_ext")
	elseif	name == " [ADB] Sharks #4"				then load_job_helper(4384, 4404, 4, "Y$KFm_ext")
	elseif	name == " [ADB] Return to the boat"		then load_job_helper(4384, 4408, 4, "Y$KFm_ext")
	elseif	name == "The Dark Current"				then load_job_helper(4411, 1844, 134, "Y$KFm_ext")
	elseif	name == " [TDC] Pinchers"				then load_job_helper(4411, 4413, 4, "Y$KFm_underwater")
	elseif	name == " [TDC] Mutant fish"			then load_job_helper(4411, 4420, 4, "Y$KFm_underwater")
	elseif	name == "Bump-Charge-Jump"				then load_job_helper(4427, 1845, 134, "Y$KFm_ext")
	elseif	name == " [BCJ] Track #1"				then load_job_helper(4427, 4433, 4, "Y$KFm_ext")
	elseif	name == " [BCJ] Track #2"				then load_job_helper(4427, 4439, 4, "Y$KFm_ext")
	elseif	name == " [BCJ] Track #3"				then load_job_helper(4427, 4444, 4, "Y$KFm_ext")
	elseif	name == "Danger in the Skies"			then load_job_helper(4451, 1846, 134, "Y$KFm_ext")
	elseif	name == " [DitS] Turrets"				then load_job_helper(4451, 4453, 4, "Y$KFm_ext")
	elseif	name == " [DitS] Bats"					then load_job_helper(4451, 4472, 4, "Y$KFm_ext")
	elseif	name == " [DitS] Dogfight"				then load_job_helper(4451, 4478, 4, "Y$KFm_ext")
	elseif	name == " [DitS] Paraglide"				then load_job_helper(4451, 4486, 4, "Y$KFm_ext")
	elseif	name == "The Ancestors' Gauntlet"		then load_job_helper(4494, 1847, 134, "Y$KFm_vault")
	elseif	name == " [TAG] Enter the gauntlet"		then load_job_helper(4494, 4495, 4, "Y$KFm_gauntlet")
	elseif	name == " [TAG] Slytunkhamen Cooper II"	then load_job_helper(4494, 4498, 4, "Y$KFm_gauntlet")
	elseif	name == " [TAG] Sir Galleth Cooper"		then load_job_helper(4494, 4500, 4, "Y$KFm_gauntlet")
	elseif	name == " [TAG] Salim al-Kupar"			then load_job_helper(4494, 4502, 4, "Y$KFm_gauntlet")
	elseif	name == " [TAG] Slaigh MacCooper"		then load_job_helper(4494, 4504, 4, "Y$KFm_gauntlet")
	elseif	name == " [TAG] Rioichi Cooper"			then load_job_helper(4494, 4506, 4, "Y$KFm_gauntlet")
	elseif	name == " [TAG] Henriette Cooper"		then load_job_helper(4494, 4508, 4, "Y$KFm_gauntlet")
	elseif	name == " [TAG] Tennessee Cooper"		then load_job_helper(4494, 4510, 4, "Y$KFm_gauntlet")
	elseif	name == " [TAG] Thaddeus W. Cooper III" then load_job_helper(4494, 4512, 4, "Y$KFm_gauntlet")
	elseif	name == " [TAG] Otto van Cooper"		then load_job_helper(4494, 4514, 4, "Y$KFm_gauntlet")
	elseif	name == " [TAG] Connor Cooper"			then load_job_helper(4494, 4516, 4, "Y$KFm_gauntlet")
	elseif	name == "Stand Your Ground"				then load_job_helper(4520, 1848, 134, "Y$KFm_vault")
	elseif	name == " [SYG] Checkpoint #1"			then load_job_helper(4520, 4531, 4, "Y$KFm_vault")
	elseif	name == " [SYG] Checkpoint #2"			then load_job_helper(4520, 4534, 4, "Y$KFm_vault")
	elseif	name == " [SYG] Place the treasures"	then load_job_helper(4520, 4538, 4, "Y$KFm_vault")
	elseif	name == "Final Legacy"					then load_job_helper(4558, 1849, 134, "Y$KFm_boss")
	elseif	name == " [FL] Carmelita section"		then load_job_helper(4558, 2041, 4, "Y$KFm_boss")
	elseif	name == "Sly Tutorial #1"				then load_job_helper(4590, 4592, 134, "Y$KFi_trainer")
	elseif	name == "Sly Tutorial #2"				then load_job_helper(4609, 4611, 134, "Y$KFi_trainer")
	elseif	name == "Sly Tutorial #3"				then load_job_helper(4609, 4611, 134, "Y$KFi_trainer")
	elseif	name == "Sly Tutorial #4"				then load_job_helper(4609, 4611, 134, "Y$KFi_trainer")
	elseif	name == "Bentley Tutorial"				then load_job_helper(4609, 4611, 134, "Y$KFi_trainer")
	elseif	name == "Murray Tutorial"				then load_job_helper(4725, 4727, 134, "Y$KFi_trainer")
	end
end


function sly3_reset_job()
	Memory.WriteInt(0x5EB488, -1)
	Memory.WriteInt(0x5EB48C, -1)
	Memory.WriteInt(0x5EB490, -1)
end