function load_job_helper(character_id, job_id, cp_id, location, map)
	
	sly2_set_map(map)
	Memory.WriteInt(0x7A830C, character_id)
	Memory.WriteInt(0x4FEBF4, job_id)
	Memory.WriteInt(0x4FEBFC, cp_id)
	Memory.WriteInt(0x7B4C98, location)
	
	-- disco demolitions is weird an requires this to work
	if (cp_id==2060 or cp_id==2888) then 
	Memory.WriteInt(0x4FEBF8, -1) 
	Memory.WriteInt(0x4FEBF4, -1)
	else Memory.WriteInt(0x4FEBF8, cp_id) end

	-- not play Paris intro cutscene
	if job_id<2000 then Memory.WriteInt(0x7A9AC0, 3) end
	
	Memory.WriteInt(0x7B4C54, 0) -- load type
	Memory.WriteInt(0x7B4C50, 1) -- trigger a load

end

function sly2_change_job_state(values, base)
	i = 1
	while values[i] do
		Memory.WriteInt(base,values[i])
		i=i+1
		base=base+0x4
	end
end

function sly2_job_loader(character_id, job_id, cp_id, location, map, values, base)
	sly2_change_job_state(values, base)
	load_job_helper(character_id, job_id, cp_id, location, map)
end

function sly2_reset_previous_job()
	jobId = Memory.ReadInt(0x4FEBF4)

	if		jobId==-1 then return
	elseif	jobId==1696 then sly2_change_job_state({0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 0x7A9578)
	elseif	jobId==1784 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,8,0,1}, 0x7A9D98)
	elseif	jobId==1795 then sly2_change_job_state({0,6,0,2,0,1,3,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,0,0,3,0}, 0x7A9C58)
	elseif	jobId==1833 then sly2_change_job_state({0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0}, 0x7A976C)
	elseif	jobId==1841 then sly2_change_job_state({0,0,0,0,0,0,2,0,0,0,0,2,0,0,0,6,2,0,0,0,2,2,0,0,0,3,1,0}, 0x7A999C)
	elseif	jobId==1900 then sly2_change_job_state({0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,2,0,0,0,0,1,0,1,0,0}, 0x7A9DFC)
	elseif	jobId==1826 then sly2_change_job_state({0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,3,0,0}, 0x7A9708)
	elseif	jobId==1874 then sly2_change_job_state({2,0,0,0,0,2,0,0,0,0,5,0,0,0,0,0}, 0x7A9BBC)
	elseif  jobId==1859 then sly2_change_job_state({0,0,0,3,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3}, 0x7A9AE8)
	elseif	jobId==1882 then sly2_change_job_state({0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,5,0,0,0,0,2,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0}, 0x7A98A4)
	elseif	jobId==1912 then sly2_change_job_state({0,4,0,0,0,0,4,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,4,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0}, 0x7A99D8)
	elseif	jobId==2003 then sly2_change_job_state({0,3,0,0,0,0,4,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,0,0,0,1,0,0,0,2,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,0,1,0,0,0,3,0,0,1,0,2,1}, 0x7AA3C4)
	elseif  jobId==2022 then sly2_change_job_state({0,0,0,1,0,3,0,0,1,0,0,0,0,1,0,0,0,0,3,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,2,0,0,0,0,1,0,0,0,0,2,0,0,0,1,2,0,0,0,1,2,0,0,0,1,4,0,0,0,0,1,0,3,0}, 0x7AA2A4)
	elseif	jobId==2059 then sly2_change_job_state({0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 0x7AA4CC)
	elseif  jobId==2034 then sly2_change_job_state({0,1,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AA570)
	elseif  jobId==2077 then sly2_change_job_state({0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,3,0,0,1,0,0,0,0,1,0,0,0,0}, 0x7AA100)
	elseif  jobId==2085 then sly2_change_job_state({0,3,0,0,1,0,0,0,0,1,0,0,0,0,4,0,0,0,0,0,0,3,0,0}, 0x7AA368)
	elseif  jobId==2092 then sly2_change_job_state({0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 0x7AA178)
	elseif  jobId==2042 then sly2_change_job_state({0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,1,0,0,0,0,0,0,0}, 0x7A9E84)
	elseif  (jobId==2141 or jobId==2111) then sly2_change_job_state({0,3,0,0,0,0,3,0,0,0,0,3,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,3,0}, 0x7A9EE0)
	elseif  jobId==2192 then sly2_change_job_state({0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,3,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AA9B4)
	elseif  jobId==2214 then sly2_change_job_state({0,1,0,0,0,0,1,0,0,0,0,3,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AA680)
	elseif  jobId==2209 then sly2_change_job_state({0,1,0,0,0,0,1,0,0,0,0,3,0,0}, 0x7AABF8)
	elseif  jobId==2254 then sly2_change_job_state({0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 0x7AA8D8)
	elseif  jobId==2302 then sly2_change_job_state({0,1,0,0,0,0,2,0,0}, 0x7AABD0)
	elseif  jobId==2286 then sly2_change_job_state({0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0}, 0x7AAB1C)
	elseif  jobId==2235 then sly2_change_job_state({1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,5,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AA760)
	elseif  jobId==2308 then sly2_change_job_state({0,1,0,0,0,0,3,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AAA90)
	elseif  (jobId==2318 or jobId==2346)  then sly2_change_job_state({1,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,3,3,0,0,0,1,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,1,0,3,0,0,1,0,3,0,0,3,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,0,0,1,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,5,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AA5CC)
	elseif  jobId==2411 then sly2_change_job_state({0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AB328)
	elseif  jobId==2427 then sly2_change_job_state({0,1,0,0,0,0,3,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AAD24)
	elseif  jobId==2447 then sly2_change_job_state({0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,0,0,0,0,0,0,0,0}, 0x7AB1CC)
	elseif  jobId==2505 then sly2_change_job_state({0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0}, 0x7AB3B4)
	elseif  jobId==2473 then sly2_change_job_state({0,1,0,0,0,0,3,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AB0BC)
	elseif  jobId==2530 then sly2_change_job_state({0,1,0,0,0,0,3,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AB1AC)
	elseif  jobId==2464 then sly2_change_job_state({0,1,0,0,0,0,1,0,0,0,0,3,0,0,0,0,1,0,0}, 0x7AAC98)
	elseif  jobId==2494 then sly2_change_job_state({0,1,0,0,0,0,1,0,0,0,0,4,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AAC34)
	elseif  jobId==2553 then sly2_change_job_state({0,0,0,1,0,3,0,0,2,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AAD1C)
	elseif  jobId==2645 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7ABBAC)
	elseif  jobId==2662 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0}, 0x7ABA08)
	elseif  jobId==2701 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,6,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0}, 0x7AB670)
	elseif  jobId==2683 then sly2_change_job_state({0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AB5C8)
	elseif  jobId==2746 then sly2_change_job_state({0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AB4CC)
	elseif  jobId==2734 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,6,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7ABA6C)
	elseif  jobId==2711 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AB7B0)
	elseif  jobId==2765 then sly2_change_job_state({0,3,0,0,0,0,3,0,0,0,0,4,0,0,0,0,3,0,0,0,0,3,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,3,0,0,0,0,5,0,0,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0}, 0x7AB850)
	elseif  jobId==2860 then sly2_change_job_state({0,2,0,0,0,0,1,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,7,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,5,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AC0C0)
	elseif  jobId==2883 then sly2_change_job_state({0,2,0,0,0,0,1,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,1,1}, 0x7ABFD0)
	elseif  jobId==2909 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,6,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0}, 0x7ABCD8)
	elseif  jobId==2904 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,4,0,0}, 0x7AC228)
	elseif  jobId==2933 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0}, 0x7AC070)
	elseif  jobId==2945 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,5,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7ABF30)
	elseif  jobId==2939 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,6,0,0}, 0x7AC1EC)
	elseif  jobId==2962 then sly2_change_job_state({0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,3,0,0}, 0x7ABE40)
	elseif  jobId==3037 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AC9E4)
	elseif  jobId==3101 then sly2_change_job_state({0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,4,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AC848)
	elseif  jobId==3056 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AC2F0)
	elseif  jobId==3083 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0}, 0x7ACAFC)
	elseif  jobId==3146 then sly2_change_job_state({0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AC278)
	elseif  jobId==3130 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0}, 0x7AC958)
	elseif  jobId==3188 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,4,0,0,0,0,2,0,0}, 0x7ACB74)
	elseif  jobId==3156 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,4,4,0,0,0,3,3,0,0,0,2,2,0,0,0,2,2,0,0,0,2,2,0,0,0,2,2,0,0,0,2,1,0,0,0,3,2,0,0,0,3,2,0,0,0,1,0,0,3,0,1,0,0,3,0,2,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2}, 0x7AC444)
	elseif  (jobId==3202 or jobId==3285) then sly2_change_job_state({0,3,0,2,2,0,3,0,2,0,0,3,0,0,2,0,3,0,0,4,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,4,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,3,0,3,0,0,2,0,3,0,0,3,0,3,0,0,2,0,3,0,0,3,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,4,4,0,0,0,3,3,0,0,0,2,2,0,0,0,2,2,0,0,0,2,2,0,0,0,2,2,0,0,0,2,1,0,0,0,3,2,0,0,0,3,2,0,0,0,2,0,0,3,0,2,0,0,3,0,2,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,1,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,2,0,3,0,0,3,0,3,0,0,2,0,3,0,0,4,0,3,0,0,3,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,3,0,3,0,0,3,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,3,0,3,0,0,3,0,3,0,0,2,0,3,0,0,3,0,3,0,1,2,0,3,0,1,2,0,3,0,1,2,0,3,0,1,3,0,3,0,1,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,1,2,0,3,0,0,2,0,3}, 0x7AC244)
	elseif  jobId==3352 then sly2_change_job_state({0,0,3,0,0,0,0,4,0,0,0,1,1,0,0,0,0,1,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,3,0,0,0,0,3,0,0,0,0,4,0,0,0,0,2,0,0,0,0,4,0,0,0,0,5,0,0}, 0x7AD0FC)
	elseif  jobId==3431 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,3,0,0,0,0,1,0,0,0,0,0,0,3,0,0,2,0,0,0,0,3,0,0}, 0x7ACE44)
	elseif  jobId==3401 then sly2_change_job_state({0,0,1,0,0,0,0,3,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,3,0,1,1,0,3}, 0x7ACD64)
	elseif  jobId==3416 then sly2_change_job_state({0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,4,0,0,0,0,3,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7ACCA0)
	elseif  jobId==3390 then sly2_change_job_state({0,0,3,0,0,0,0,3,0,0,0,0,4,0,0,0,0,2,0,0,0,0,4,0,0,0,0,5,0,0}, 0x7AD2F0)
	elseif  jobId==3464 then sly2_change_job_state({0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0}, 0x7AD088)
	elseif  (jobId==3477 or jobId==3482) then sly2_change_job_state({0,1,0,0,0,1,0,0,3,0,1,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,3,0,0,0,1,1,0,3,0,3,1,0,3,0,1,1,0,3,0,2,1,0,3,0,6,3,0,3,0,0,1,0,3,0,2,3,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,1,1,0,3,0,2,2,0,3,0,1,1,0,3,0,1,1,0,3,0,2,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,2,1,0,3,0,2,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,2,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,1,1,0,3,0,4,2,0,3,0,2,2,0,3,0,0,1,0,0,0,0,0,0,3,0,1,1,0,3,0,2,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,0,3,0,0,0,0,4,0,0,0,1,1,0,3,0,1,1,0,3,0,2,1,0,3,0,4,2,0,3,0,1,2,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,1,1,0,3,0,2,1,0,3,0,1,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,2,2,0,3,0,0,1,0,3,0,2,2,0,3,0,2,2,0,3,0,2,2,0,3,0,1,1,0,3,0,2,2,0,3,0,3,2,0,3,0,0,4,0,0,0,0,6,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 0x7ACBEC)
	end
end

function sly2_load_job(index)
	-- Loads a job based on the selection in the dropdown menu
	sly2_reset_previous_job()

	local name = Trainer.GetControlByName('jobSelectDropDown').Items[index] 
	-- using names instead of indices in case the order or contents are later changed

	-- If you change the names, remember to also change the name in trainer.json!
	if		name == "Cairo Museum Break-in"			then sly2_job_loader(7, 1696, 1584, 148457, "Y$KFjb_intro", {0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 0x7A9578)
	elseif	name == "Satellite Sabotage"			then sly2_job_loader(7, 1784, 1785, 122409, "Y$KFf_nightclub_exterior", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,8,0,1}, 0x7A9D98)
	elseif	name == "Breaking and Entering"			then sly2_job_loader(7, 1795, 1797, 397,    "Y$KFf_nightclub_cellar", {0,6,0,2,0,1,3,0,2,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,0,0,3,0}, 0x7A9C58)
	elseif	name == " [BnE] Crawl"					then sly2_job_loader(7, 1795, 1802, 122447, "Y$KFf_nightclub_cellar", {0,1,0,0,0,0,2,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0}, 0x7A976C)
	elseif	name == " [BnE] Yellow Lasers"			then sly2_job_loader(7, 1795, 1808, 122448, "Y$KFf_nightclub_cellar")
	elseif	name == " [BnE] Print Room"				then sly2_job_loader(7, 1795, 1814, 402,    "Y$KFf_nightclub_heist")
	elseif	name == "Bug Dimitri\'s Office"			then sly2_job_loader(7, 1833, 1834, 122459, "Y$KFf_nightclub_exterior", {0,1,0,0,0,0,2,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0}, 0x7A976C)
	elseif	name == " [BDO] Nightclub"				then sly2_job_loader(7, 1833, 1834, 398,    "Y$KFf_nightclub_disco")
	elseif	name == "Follow Dimitri"				then sly2_job_loader(7, 1841, 1585, 122473, "Y$KFf_nightclub_exterior", {0,0,0,0,0,0,2,0,0,0,0,2,0,0,0,6,2,0,0,0,2,2,0,0,0,3,1,0}, 0x7A999C)
	elseif	name == " [FD] Follow"					then load_job_helper(7, 1841, 1842, 122475, "Y$KFf_nightclub_exterior")
	elseif	name == "Waterpump Destruction"			then sly2_job_loader(9, 1900, 1901, 399,    "Y$KFf_nightclub_waterpump", {0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,2,0,0,0,0,1,0,1,0,2}, 0x7A9DFC)
	elseif	name == "Silence the Alarms"			then sly2_job_loader(9, 1826, 1586, 122451, "Y$KFf_nightclub_exterior", {0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,3,0,1}, 0x7A9708)
	elseif	name == "Moonlight Rendezvous"			then sly2_job_loader(7, 1874, 1875, 122519, "Y$KFf_nightclub_exterior", {2,0,0,0,0,2,0,0,0,0,5,0,1,0,0,0}, 0x7A9BBC)
	elseif	name == "Theater Pickpocketing"			then sly2_job_loader(7, 1859, 1588, 400,    "Y$KFf_nightclub_moulinrouge", {0,0,0,3,0,0,0,0,2,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3}, 0x7A9AE8)
	elseif	name == "Disco Demolitions"				then sly2_job_loader(8, -1, 1587, 401,    "Y$KFf_nightclub_disco", {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,5,0,1,0,0,2,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0}, 0x7A98A4)
	elseif	name == "OP: Thunder Beak"				then sly2_job_loader(8, 1912, 1913, 27280,  "Y$KFf_nightclub_exterior", {0,4,0,0,0,0,4,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,4,0,1,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0}, 0x7A99D8)
	elseif	name == " [TB] Steal the Key"			then load_job_helper(7, 1912, 1923, 27280,  "Y$KFf_nightclub_exterior")
	elseif	name == " [TB] Climb the Peacock"		then load_job_helper(7, 1912, 1929, 27280,  "Y$KFf_nightclub_exterior")
	elseif	name == " [TB] Dimitri Fight"			then load_job_helper(7, 1912, 1941, 121308, "Y$KFf_nightclub_heist")
	elseif	name == "Recon the Ballroom"			then sly2_job_loader(7, 2003, 2006, 49223, "Y$KFi_palace_ext", {0,3,0,0,0,0,4,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,0,0,0,1,0,0,0,2,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,0,1,0,0,0,3,0,0,1,0,2,1}, 0x7AA3C4)
	elseif	name == " [RtB] Pictures"				then load_job_helper(7, 2003, 2007, 104738, "Y$KFi_palace_ballroom")
	elseif	name == "Lower the Drawbridge"			then sly2_job_loader(7, 2022, 2024, 105705, "Y$KFi_palace_ext", {0,0,0,1,0,3,0,0,1,0,0,0,0,1,0,0,0,0,3,0,1,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,2,0,0,0,0,1,0,0,0,0,2,0,0,0,1,2,0,0,0,1,2,0,0,0,1,4,0,0,0,0,1,0,3,0}, 0x7AA2A4)
	elseif	name == "Steal a Tuxedo"				then sly2_job_loader(7, 2059, 2060, 105779, "Y$KFi_palace_int", {0,0,0,0,0,5,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 0x7AA4CC)
	elseif	name == "Battle the Chopper"			then sly2_job_loader(9, 2034, 2035, 105722, "Y$KFi_palace_ext", {0,1,0,0,1,0,0,0,0,1,0,0,0,0,2,0,1,0,0,2,0,0}, 0x7AA570)
	elseif	name == " [BtC] Chopper Fight"			then load_job_helper(9, 2034, 2038, 105722, "Y$KFi_palace_ext")
	elseif	name == "Dominate the Dance Floor"		then sly2_job_loader(7, 2077, 2079, 105063, "Y$KFi_palace_ext", {0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,3,0,0,1,0,1,0,0,1,0,0,0,0}, 0x7AA100)
	elseif	name == " [DtDF] Dance"					then load_job_helper(7, 2077, 2081, 105063, "Y$KFi_palace_ballroom")
	elseif	name == "RC Bombing Run"				then sly2_job_loader(8, 2085, 2087, 0,      "Y$KFi_palace_ext", {0,3,0,0,1,0,0,0,0,1,0,0,0,0,4,0,1,0,0,0,0,3,0,0}, 0x7AA368)
	elseif	name == " [RBR] Destroy the Jeep"		then load_job_helper(8, 2085, 2089, 0,      "Y$KFi_palace_ext")
	elseif	name == "Elephant Rampage"				then sly2_job_loader(7, 2092, 2094, 105619, "Y$KFi_palace_ext", {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 0x7AA178)
	elseif	name == " [ER] Climb the Elephants"		then load_job_helper(7, 2092, 2097, 105619, "Y$KFi_palace_ext")
	elseif	name == "Boardroom Brawl"				then sly2_job_loader(7, 2042, 1589, 105734, "Y$KFi_palace_ext", {0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,1,0,0,2,0,0,0,0,1,0,0,0,0,0,0,0}, 0x7A9E84)
	elseif	name == " [BB] Protect Bentley"			then load_job_helper(9, 2042, 1592, 105764, "Y$KFi_palace_basement")
	elseif	name == "OP: Hippo Drop"				then sly2_job_loader(8, 2111, 1593, 76733,  "Y$KFi_palace_ext", {0,3,0,0,0,0,3,0,0,0,0,3,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,3,0}, 0x7A9EE0)
	elseif	name == " [HD] Second Floor"			then load_job_helper(8, 2111, 2126, 105827, "Y$KFi_palace_ext")
	elseif	name == " [HD] Dance"					then load_job_helper(7, 2111, 1594, 105063, "Y$KFi_palace_ballroom")
	elseif	name == " [HD] Protect Murray"			then load_job_helper(9, 2141, 2143, 105685, "Y$KFi_palace_ext")
	elseif	name == "Spice Room Recon"				then sly2_job_loader(7, 2192, 2193, 403,    "Y$KFi_temple_ext", {0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AA9B4)
	elseif	name == " [SRR] Interior"				then load_job_helper(7, 2192, 2196, 398,    "Y$KFi_temple_int")
	elseif	name == "Freeing the Elephant"			then sly2_job_loader(7, 2214, 2217, 96699,  "Y$KFi_temple_ext", {0,1,0,0,0,0,1,0,0,0,0,3,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AA680)
	elseif	name == "Bug Rajan's Office"			then sly2_job_loader(7, 2209, 2210, 96698,  "Y$KFi_temple_ext", {0,1,0,0,0,0,1,0,0,0,0,3,0,1}, 0x7AABF8)
	elseif	name == " [BRO] Office"					then load_job_helper(7, 2209, 2210, 397,  "Y$KFi_temple_int")
	elseif	name == "Leading Rajan"					then sly2_job_loader(8, 2254, 2261, 96737,  "Y$KFi_temple_ext", {0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 0x7AA8D8)
	elseif	name == "Blow the Dam"					then sly2_job_loader(8, 2302, 2305, 17505,  "Y$KFi_temple_ext", {0,1,0,0,0,0,2,0,1}, 0x7AABD0)
	elseif	name == "Spice Grinder Destruction"		then sly2_job_loader(7, 2286, 2287, 400,    "Y$KFi_temple_int", {0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,1,0,0,1,0,0,0,0,1,0,0,0}, 0x7AAB1C)
	elseif	name == "Neyla's Secret"				then sly2_job_loader(7, 2235, 2236, 401,    "Y$KFi_temple_ext", {1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,5,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AA760)
	elseif	name == "Rip-Off the Ruby"				then sly2_job_loader(7, 2308, 2309, 96658,  "Y$KFi_temple_ext", {0,1,0,0,0,0,3,0,1,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AAA90)
	elseif	name == "OP: Wet Tiger"					then sly2_job_loader(9, 2318, 2320, 33676,  "Y$KFi_temple_ext", {1,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,3,3,0,0,0,1,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,1,0,3,0,0,1,0,3,0,0,3,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,0,0,1,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,5,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,1}, 0x7AA5CC)
	elseif	name == " [WT] Rajan fight"				then load_job_helper(9, 2346, 2354, 96835,  "Y$KFi_temple_ext")
	elseif	name == "Eavesdrop on Contessa"			then sly2_job_loader(8, 2411, 2420, 17366,  "Y$KFp_prison_ext", {0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,1,0,0,1,0,0}, 0x7AB328)
	elseif	name == "Train Hack"					then sly2_job_loader(8, 2427, 2433, 76660,  "Y$KFp_prison_ext", {0,1,0,0,0,0,3,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AAD24)
	elseif	name == "Wall Bombing"					then sly2_job_loader(8, 2447, 2450, 76682,  "Y$KFp_prison_ext", {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,1,0,0,1,0,0,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,0,0,0,0,0,0,0,0}, 0x7AB1CC)
	elseif	name == "Code Capture"					then sly2_job_loader(7, 2505, 2507, 76753,  "Y$KFp_prison_ext", {0,1,0,0,0,0,2,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0}, 0x7AB3B4)
	elseif	name == "Lightning Action"				then sly2_job_loader(7, 2473, 2475, 76716,  "Y$KFp_prison_ext", {0,1,0,0,0,0,3,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AB0BC)
	elseif	name == "Close to Contessa"				then sly2_job_loader(7, 2530, 2537, 76776,  "Y$KFp_prison_ext", {0,1,0,0,0,0,3,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0}, 0x7AB1AC)
	elseif	name == "Big House Brawl"				then sly2_job_loader(7, 2464, 2465, 76697,  "Y$KFp_prison_ext", {0,1,0,0,0,0,1,0,0,0,0,3,0,1,0,0,1,0,0}, 0x7AAC98)
	elseif	name == "Disguise Bridge"				then sly2_job_loader(7, 2494, 2495, 76733,  "Y$KFp_prison_ext", {0,1,0,0,0,0,1,0,0,0,0,4,0,1,0,0,1,0,0,0,0,1,0,0}, 0x7AAC34)
	elseif	name == "OP: Trojan Tank"				then sly2_job_loader(8, 2553, 2556, 76786,  "Y$KFp_prison_ext", {0,0,0,1,0,3,0,0,2,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,1,2,0,1,0,1,4,0,2,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1,4,0,2}, 0x7AAD1C)
	elseif	name == "Know Your Enemy"				then sly2_job_loader(7, 2645, 2646, 49223,	"Y$KFp_castle_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7ABBAC)
	elseif	name == "Ghost Capture"					then sly2_job_loader(7, 2662, 2663, 59748,	"Y$KFp_castle_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,1}, 0x7ABA08)
	elseif	name == "Kidnap the General"			then sly2_job_loader(9, 2701, 2702, 59820,	"Y$KFp_castle_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,6,0,1,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0}, 0x7AB670)
	elseif	name == "Mojo Trap Action"				then sly2_job_loader(8, 2683, 2689, 393,	"Y$KFp_castle_ewoktrainer", {0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AB5C8)
	elseif	name == "Crypt Hack"					then sly2_job_loader(8, 2746, 2748, 59882,	"Y$KFp_castle_heist", {0,2,0,0,0,0,3,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AB4CC)
	elseif	name == "Tank Showdown"					then sly2_job_loader(9, 2734, 2735, 59868,	"Y$KFp_castle_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,6,0,1,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7ABA6C)
	elseif	name == "Stealing Voices"				then sly2_job_loader(7, 2711, 2712, 59827,	"Y$KFp_castle_ext", {0,2,0,0,0,0,2,0,0,0,0,4,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AB7B0)
	elseif	name == "OP: High Road"					then sly2_job_loader(9, 2765, 2766, 27280,	"Y$KFp_castle_ext", {0,3,0,0,0,0,3,0,0,0,0,4,0,0,0,0,3,0,0,0,0,3,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,1,0,0,3,0,0,0,0,5,0,0,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0}, 0x7AB850)
	elseif  name == "Cabin Crimes"					then sly2_job_loader(7, 2860, 2861, 49223,	"Y$KFc_train_ext", {0,2,0,0,0,0,1,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,7,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,5,0,1,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AC0C0)
	elseif  name == "Spice in the Sky"				then sly2_job_loader(7, 2883, 2888, 49254,	"Y$KFc_train_ext", {0,2,0,0,0,0,1,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,1,1}, 0x7ABFD0)
	elseif  name == "A Friend in Need"				then sly2_job_loader(7, 2909, 2912, 49280,	"Y$KFc_train_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,6,0,1,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0}, 0x7ABCD8)
	elseif  name == "Ride the Iron Horse"			then sly2_job_loader(8, 2904, 2905, 49276,	"Y$KFc_train_ext", {0,2,0,0,0,0,2,0,0,0,0,4,0,1}, 0x7AC228)
	elseif  name == "Aerial Assault"				then sly2_job_loader(8, 2933, 2934, 49304,	"Y$KFc_train_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,1}, 0x7AC070)
	elseif  name == "Bear Cub Kidnapping"			then sly2_job_loader(9, 2945, 2946, 49324,	"Y$KFc_train_ext", {0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,5,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7ABF30)
	elseif  name == "Theft on the Rails"			then sly2_job_loader(7, 2939, 2940, 49310,	"Y$KFc_train_ext", {0,2,0,0,0,0,2,0,0,0,0,6,0,1}, 0x7AC1EC)
	elseif  name == "OP: Choo-Choo"					then sly2_job_loader(9, 2962, 2965, 27280,	"Y$KFc_train_ext", {0,2,0,0,0,0,3,0,1,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,3,0,0}, 0x7ABE40)
	elseif  name == "Recon the Sawmill"				then sly2_job_loader(7, 3037, 3038, 33420,	"Y$KFc_sawmill_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AC9E4)
	elseif  name == "Laser Redirection"				then sly2_job_loader(7, 3101, 3102, 393,	"Y$KFc_sawmill_burn", {0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,4,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,1,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AC848)
	elseif  name == "Bearcave Bugging"				then sly2_job_loader(7, 3056, 3057, 33437,	"Y$KFc_sawmill_ext", {0,2,0,0,0,0,2,0,0,0,0,4,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AC2F0)
	elseif  name == "RC Combat Club"				then sly2_job_loader(9, 3083, 3087, 33479,	"Y$KFc_sawmill_ext", {0,2,0,0,0,0,2,0,0,0,0,4,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0}, 0x7ACAFC)
	elseif  name == "Old Grizzle Face"				then sly2_job_loader(9, 3146, 3149, 33583,	"Y$KFc_sawmill_ext", {0,2,0,0,0,0,4,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7AC278)
	elseif  name == "Lighthouse Break In"			then sly2_job_loader(7, 3130, 3132, 33551,	"Y$KFc_sawmill_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,1,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0}, 0x7AC958)
	elseif  name == "Thermal Ride"					then sly2_job_loader(7, 3188, 3190, 33645,	"Y$KFc_sawmill_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,4,0,1,0,0,2,0,0}, 0x7ACB74)
	elseif  name == "Boat Hack"						then sly2_job_loader(8, 3156, 3158, 33596,	"Y$KFc_sawmill_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,1,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,4,4,0,0,0,3,3,0,0,0,2,2,0,0,0,2,2,0,0,0,2,2,0,0,0,2,2,0,0,0,2,1,0,0,0,3,2,0,0,0,3,2,0,0,0,1,0,0,3,0,1,0,0,3,0,2,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2}, 0x7AC444)
	elseif  name == "OP: Canada Games"				then sly2_job_loader(8, 3202, 3208, 33664,	"Y$KFc_sawmill_ext", {0,3,0,2,2,0,3,0,2,0,0,3,0,0,2,0,3,0,0,4,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,4,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,3,0,3,0,0,2,0,3,0,0,3,0,3,0,0,2,0,3,0,0,3,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,4,4,0,0,0,3,3,0,0,0,2,2,0,0,0,2,2,0,0,0,2,2,0,0,0,2,2,0,0,0,2,1,0,0,0,3,2,0,0,0,3,2,0,0,0,2,0,0,3,0,2,0,0,3,0,2,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,2,0,0,0,1,0,0,3,0,0,0,0,3,0,0,0,0,3,0,0,2,0,3,0,0,3,0,3,0,0,2,0,3,0,0,4,0,3,0,0,3,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,3,0,3,0,0,3,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,3,0,3,0,0,3,0,3,0,0,2,0,3,0,0,3,0,3,0,1,2,0,3,0,1,2,0,3,0,1,2,0,3,0,1,3,0,3,0,1,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,0,2,0,3,0,1,2,0,3,0,0,2,0,3}, 0x7AC244)
	elseif  name == "Blimp HQ Recon"				then sly2_job_loader(7, 3352, 3354, 17366,	"Y$KFa_blimp_ext", {0,0,3,0,0,0,0,4,0,0,0,1,1,0,0,0,0,1,0,0,0,0,3,0,1,0,0,2,0,0,0,0,2,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,2,0,0,0,0,1,0,0,0,0,3,0,0,0,0,3,0,0,0,0,4,0,0,0,0,2,0,0,0,0,4,0,0,0,0,5,0,0}, 0x7AD0FC)
	elseif  name == "Bentley/Murray Team Up"		then sly2_job_loader(8, 3431, 3433, 17466,	"Y$KFa_blimp_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,0,0,0,3,0,0,0,0,1,0,0,0,0,0,0,3,0,0,2,0,0,0,0,3,0,0}, 0x7ACE44)
	elseif  name == "Murray/Sly Tag Team"			then sly2_job_loader(9, 3401, 3403, 17420,	"Y$KFa_blimp_ext", {0,0,1,0,0,0,0,3,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,3,0,1,1,0,3}, 0x7ACD64)
	elseif  name == "Sly/Bentley Conspire"			then sly2_job_loader(7, 3416, 3419, 17451,	"Y$KFa_blimp_ext", {0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,3,0,1,0,0,4,0,0,0,0,3,0,0,0,0,4,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0}, 0x7ACCA0)
	elseif  name == "Charged TNT Run"				then sly2_job_loader(7, 3390, 3391, 17401,	"Y$KFa_blimp_ext", {0,0,3,0,0,0,0,3,0,0,0,0,4,0,0,0,0,2,0,0,0,0,4,0,0,0,0,5,0,1}, 0x7AD2F0)
	elseif  name == "Mega-Jump Job"					then sly2_job_loader(7, 3464, 3466, 17485,	"Y$KFa_blimp_ext", {0,2,0,0,0,0,3,0,1,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0}, 0x7AD088)
	elseif  name == "Showdown with Clock-La"		then sly2_job_loader(7, 3477, 3479, 17485,	"Y$KFa_blimp_ext", {0,1,0,0,0,1,0,0,3,0,1,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,0,0,0,4,0,0,0,0,3,0,0,0,1,1,0,3,0,3,1,0,3,0,1,1,0,3,0,2,1,0,3,0,6,3,0,3,0,0,1,0,3,0,2,3,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,1,1,0,3,0,2,2,0,3,0,1,1,0,3,0,1,1,0,3,0,2,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,2,1,0,3,0,2,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,2,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,1,1,0,3,0,4,2,0,3,0,2,2,0,3,0,0,1,0,0,0,0,0,0,3,0,1,1,0,3,0,2,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,0,3,0,0,0,0,4,0,0,0,1,1,0,3,0,1,1,0,3,0,2,1,0,3,0,4,2,0,3,0,1,2,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,1,1,0,3,0,2,1,0,3,0,1,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,0,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,1,1,0,3,0,2,2,0,3,0,0,1,0,3,0,2,2,0,3,0,2,2,0,3,0,2,2,0,3,0,1,1,0,3,0,2,2,0,3,0,3,2,0,3,0,0,4,0,0,0,0,6,0,1,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 0x7ACBEC)
	end
end


function sly2_reset_job()
	Memory.WriteInt(0x4FEBF4, -1)
	Memory.WriteInt(0x4FEBF8, -1)
	Memory.WriteInt(0x4FEBFC, -1)
end