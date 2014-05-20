namespace"trit"{
namespace"input"{
	class"Analog"{
	    	metamethod"_init"
	    	:body(function(self,num)
	    		self.sign = 1;
	    		self.num = num
	    	end);
	    	
	    	metamethod"__call"
	    	:body(function(self)
	    		return _ANALOG(self.num)/1000*self.sign
	    	end);
	};
};};