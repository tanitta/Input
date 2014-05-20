namespace"trit"{
namespace"input"{
	class "Keyboard"{
		metamethod"_init"
		:body(
			function(self)
				self.booCondition = false;
				self.key = {}
				self.keylog = {}
			end
		);
		
		method"SetCondition"
		:body(
			function(self,boo)
				if type(boo) == "boolean" then
					self.booCondition = boo;
				elseif type(boo) == "number" then
					if boo == 1 then
						self.booCondition = true
					elseif boo == 0 then
						self.booCondition = false
					end
				end
				
			end
		);
		
		
		method"Key"
		:body(
			function(self,str)
				local num
				if type(str) == "string" then
					num = string.byte(str)
				elseif type(str) == "number" then
					num = str
				end
				
				self.booLowercase = (_RAWKEY(16) == 0)
				local keyfunc = _RAWKEY
				
				if self.booCondition then
					if self.booLowercase then
						--è¨ï∂éö
						if (97<= num) and (num <= 122) then
							self.key[num] = keyfunc(num-32);
							
						elseif 48<=num and num <=57 then--êîéö
							self.key[num] = keyfunc(num)
							
						elseif 44<=num and num <=47 then--,-./
							self.key[num] = keyfunc(num-44+188)
							
						elseif 58<=num and num <=59 then--:;
							self.key[num] = keyfunc(num-58+186)
							
						elseif num == 64 then--@
							self.key[num] = keyfunc(192)
							
						elseif 91<=num and num <=94 then--[\]^
							self.key[num] = keyfunc(num-91+219)
							
						else
							self.key[num] = 0;
						end
					else
						--ëÂï∂éö
						if (65<= num) and (num <= 90) then
							self.key[num] = keyfunc(num);
							
						elseif 33<=num and num <=41 then--!"#$%&'()
							self.key[num] = keyfunc(num+16)
							
						elseif 60<=num and num <=63 then--<=>?
							self.key[num] = keyfunc(num-60+188)
							
						elseif 42<=num and num <=43 then--*+
							self.key[num] = keyfunc(num-42+186)
							
						elseif num == 96 then--`
							self.key[num] = keyfunc(192)
							
						elseif 123<=num and num <=126 then--{|}~
							self.key[num] = keyfunc(num-123+219)
							
						elseif num == 95 then--_
							self.key[num] = keyfunc(226)
							
						else
							self.key[num] = 0;
						end
					end
				
					
					
				else
					self.key[num] = 0;
				end
				
				
				
				self.keylog[num] = self.key[num]
				
				return self.key[num]
			end
		);
		
		method"KeyDown"
		:body(
			function(self,str)
				local num
				if type(str) == "string" then
					num = string.byte(str)
				elseif type(str) == "number" then
					num = str
				end
				
				self.booLowercase = (_RAWKEY(16) == 0)
				local keyfunc = _RAWKEY
				
				if self.booCondition then
					if self.booLowercase then
						
						if (97<= num) and (num <= 122) then
							self.key[num] = keyfunc(num-32);
						else
							self.key[num] = 0;
						end
						
					else
						
						if (65<= num) and (num <= 90) then
							self.key[num] = keyfunc(num);
						else 
							self.key[num] = 0;
						end
					end
				else
					self.key[num] = 0;
				end
				
				local rtn = 0
				
				if self.keylog[num] == 0 and self.key[num] == 1 then
					rtn = 1
				else
					rtn = 0
				end
				
				self.keylog[num] = self.key[num]
				
				return rtn;
			end
		);
		
		method"KeyUp"
		:body(
			function(self,str)
				local num
				if type(str) == "string" then
					num = string.byte(str)
				elseif type(str) == "number" then
					num = str
				end
				
				self.booLowercase = (_RAWKEY(16) == 0)
				local keyfunc = _RAWKEY
				
				if self.booCondition then
					if self.booLowercase then
						
						if (97<= num) and (num <= 122) then
							self.key[num] = keyfunc(num-32);
						else
							self.key[num] = 0;
						end
						
					else
						
						if (65<= num) and (num <= 90) then
							self.key[num] = keyfunc(num);
						else 
							self.key[num] = 0;
						end
					end
				else
					self.key[num] = 0;
				end
				
				local rtn = 0
				
				if self.keylog[num] == 1 and self.key[num] == 0 then
					rtn = 1
				else
					rtn = 0
				end
				
				self.keylog[num] = self.key[num]
				
				return rtn;
			end
		);

		
		

		
	
		metamethod"__call"
		:body(
			function(self)
			end
		);
	};
};
};