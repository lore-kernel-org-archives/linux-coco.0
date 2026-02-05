Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C412DE702
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309477; cv=none; b=VWSRSGMqGXM9fKBTwBwA0etj+UOqpgQdp4NQBpzvmGuRQI5FZXBP3b164lTRm1T15xQnfjO8e3Dgp9A8Bur21HYTtVkOX/ecMHAQuRo8Ldfe5OWHtbZUtC0NN47cyFfdeRQBd/ppYPiZtXPPo8Y7/h8MhfNE9KBB7yj4S3b6Zyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309477; c=relaxed/simple;
	bh=1GdzYKuwvL32RBgFC3nFDC1mGn6Frf7pi1eenGkA/mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0tpNtVSVpsUIj7QDgvWxqb/Xhz8JdVb9em7mL5NmrXdDc4NDBGI/SaSOEtfvwvTydCkXW8VWlLpzjB2Hok9AaizZcPm6r5eQg+lVVnzQGUMbdUxLI0Wk4+y+v14wBYkdRyEi3+XyLbUAhZTMNXkdxDZekmKyObCauTIFcW9jgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REG169Q+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REG169Q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770309477; x=1801845477;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1GdzYKuwvL32RBgFC3nFDC1mGn6Frf7pi1eenGkA/mE=;
  b=REG169Q+QgPuU6nqVtg/yGgcg+MI5rFkvVULGkMuYK7QpQYIs0oNPfRS
   K3C6HmP9o+hRNtQ5JvyuVfX/GrJD6xTgVVDntPi2Jl4GOEPHJLQbYaqFi
   YgZQRwJxri0dy7xOjsn4qm0zOXoVFI74r16v/k2KHAQcKe4Se7w5++n8T
   h84UeJDC81A45ZVp6xFBFt+2vmdZUBEXsFp/nZAWwxCs2GAo1oDfNa3SB
   4alqwoYtmRfFeUfnryFoepRLO1tXPSppJuGbmjOvyy3UO9kSx4zX/vUFi
   q7sJ1p+eLSK9XnlR7Y1t0BCp+ac9kNSO1x1IUgLEPWcmWAENhus5rBy2c
   Q==;
X-CSE-ConnectionGUID: CUrIs6RbTIK60Xl+gZp7WQ==
X-CSE-MsgGUID: dCrceQpXTeON5x0Qe+L45A==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71611005"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71611005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:37:53 -0800
X-CSE-ConnectionGUID: PSlboNBVQR6gCcAhcumN9Q==
X-CSE-MsgGUID: 6kRbF+MYRgipHkoNlOhcfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="241258620"
Received: from tfalcon-desk.amr.corp.intel.com (HELO [10.125.111.86]) ([10.125.111.86])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:37:52 -0800
Message-ID: <75bdc4cd-c3c4-465f-8c53-da7cdb2fb633@intel.com>
Date: Thu, 5 Feb 2026 08:37:51 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/26] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
To: Sean Christopherson <seanjc@google.com>, Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
 ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
 yilun.xu@linux.intel.com, sagis@google.com, vannapurve@google.com,
 paulmck@kernel.org, nik.borisov@suse.com, zhenzhong.duan@intel.com,
 rick.p.edgecombe@intel.com, kas@kernel.org, dave.hansen@linux.intel.com,
 vishal.l.verma@intel.com, Farrah Chen <farrah.chen@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-8-chao.gao@intel.com>
 <301f8156-bafe-440a-8628-3bf8fae74464@intel.com> <aXywVcqbXodADg4a@intel.com>
 <fedb3192-e68c-423c-93b2-a4dc2f964148@intel.com> <aYHmUCLRYL+JX1ga@intel.com>
 <aYIXFmT-676oN6j0@google.com> <aYKKnf7K3lRdUcxl@intel.com>
 <aYTFZv9Mf_FqWM_k@google.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 xsFNBE6HMP0BEADIMA3XYkQfF3dwHlj58Yjsc4E5y5G67cfbt8dvaUq2fx1lR0K9h1bOI6fC
 oAiUXvGAOxPDsB/P6UEOISPpLl5IuYsSwAeZGkdQ5g6m1xq7AlDJQZddhr/1DC/nMVa/2BoY
 2UnKuZuSBu7lgOE193+7Uks3416N2hTkyKUSNkduyoZ9F5twiBhxPJwPtn/wnch6n5RsoXsb
 ygOEDxLEsSk/7eyFycjE+btUtAWZtx+HseyaGfqkZK0Z9bT1lsaHecmB203xShwCPT49Blxz
 VOab8668QpaEOdLGhtvrVYVK7x4skyT3nGWcgDCl5/Vp3TWA4K+IofwvXzX2ON/Mj7aQwf5W
 iC+3nWC7q0uxKwwsddJ0Nu+dpA/UORQWa1NiAftEoSpk5+nUUi0WE+5DRm0H+TXKBWMGNCFn
 c6+EKg5zQaa8KqymHcOrSXNPmzJuXvDQ8uj2J8XuzCZfK4uy1+YdIr0yyEMI7mdh4KX50LO1
 pmowEqDh7dLShTOif/7UtQYrzYq9cPnjU2ZW4qd5Qz2joSGTG9eCXLz5PRe5SqHxv6ljk8mb
 ApNuY7bOXO/A7T2j5RwXIlcmssqIjBcxsRRoIbpCwWWGjkYjzYCjgsNFL6rt4OL11OUF37wL
 QcTl7fbCGv53KfKPdYD5hcbguLKi/aCccJK18ZwNjFhqr4MliQARAQABzUVEYXZpZCBDaHJp
 c3RvcGhlciBIYW5zZW4gKEludGVsIFdvcmsgQWRkcmVzcykgPGRhdmUuaGFuc2VuQGludGVs
 LmNvbT7CwXgEEwECACIFAlQ+9J0CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEGg1
 lTBwyZKwLZUP/0dnbhDc229u2u6WtK1s1cSd9WsflGXGagkR6liJ4um3XCfYWDHvIdkHYC1t
 MNcVHFBwmQkawxsYvgO8kXT3SaFZe4ISfB4K4CL2qp4JO+nJdlFUbZI7cz/Td9z8nHjMcWYF
 IQuTsWOLs/LBMTs+ANumibtw6UkiGVD3dfHJAOPNApjVr+M0P/lVmTeP8w0uVcd2syiaU5jB
 aht9CYATn+ytFGWZnBEEQFnqcibIaOrmoBLu2b3fKJEd8Jp7NHDSIdrvrMjYynmc6sZKUqH2
 I1qOevaa8jUg7wlLJAWGfIqnu85kkqrVOkbNbk4TPub7VOqA6qG5GCNEIv6ZY7HLYd/vAkVY
 E8Plzq/NwLAuOWxvGrOl7OPuwVeR4hBDfcrNb990MFPpjGgACzAZyjdmYoMu8j3/MAEW4P0z
 F5+EYJAOZ+z212y1pchNNauehORXgjrNKsZwxwKpPY9qb84E3O9KYpwfATsqOoQ6tTgr+1BR
 CCwP712H+E9U5HJ0iibN/CDZFVPL1bRerHziuwuQuvE0qWg0+0SChFe9oq0KAwEkVs6ZDMB2
 P16MieEEQ6StQRlvy2YBv80L1TMl3T90Bo1UUn6ARXEpcbFE0/aORH/jEXcRteb+vuik5UGY
 5TsyLYdPur3TXm7XDBdmmyQVJjnJKYK9AQxj95KlXLVO38lczsFNBFRjzmoBEACyAxbvUEhd
 GDGNg0JhDdezyTdN8C9BFsdxyTLnSH31NRiyp1QtuxvcqGZjb2trDVuCbIzRrgMZLVgo3upr
 MIOx1CXEgmn23Zhh0EpdVHM8IKx9Z7V0r+rrpRWFE8/wQZngKYVi49PGoZj50ZEifEJ5qn/H
 Nsp2+Y+bTUjDdgWMATg9DiFMyv8fvoqgNsNyrrZTnSgoLzdxr89FGHZCoSoAK8gfgFHuO54B
 lI8QOfPDG9WDPJ66HCodjTlBEr/Cwq6GruxS5i2Y33YVqxvFvDa1tUtl+iJ2SWKS9kCai2DR
 3BwVONJEYSDQaven/EHMlY1q8Vln3lGPsS11vSUK3QcNJjmrgYxH5KsVsf6PNRj9mp8Z1kIG
 qjRx08+nnyStWC0gZH6NrYyS9rpqH3j+hA2WcI7De51L4Rv9pFwzp161mvtc6eC/GxaiUGuH
 BNAVP0PY0fqvIC68p3rLIAW3f97uv4ce2RSQ7LbsPsimOeCo/5vgS6YQsj83E+AipPr09Caj
 0hloj+hFoqiticNpmsxdWKoOsV0PftcQvBCCYuhKbZV9s5hjt9qn8CE86A5g5KqDf83Fxqm/
 vXKgHNFHE5zgXGZnrmaf6resQzbvJHO0Fb0CcIohzrpPaL3YepcLDoCCgElGMGQjdCcSQ+Ci
 FCRl0Bvyj1YZUql+ZkptgGjikQARAQABwsFfBBgBAgAJBQJUY85qAhsMAAoJEGg1lTBwyZKw
 l4IQAIKHs/9po4spZDFyfDjunimEhVHqlUt7ggR1Hsl/tkvTSze8pI1P6dGp2XW6AnH1iayn
 yRcoyT0ZJ+Zmm4xAH1zqKjWplzqdb/dO28qk0bPso8+1oPO8oDhLm1+tY+cOvufXkBTm+whm
 +AyNTjaCRt6aSMnA/QHVGSJ8grrTJCoACVNhnXg/R0g90g8iV8Q+IBZyDkG0tBThaDdw1B2l
 asInUTeb9EiVfL/Zjdg5VWiF9LL7iS+9hTeVdR09vThQ/DhVbCNxVk+DtyBHsjOKifrVsYep
 WpRGBIAu3bK8eXtyvrw1igWTNs2wazJ71+0z2jMzbclKAyRHKU9JdN6Hkkgr2nPb561yjcB8
 sIq1pFXKyO+nKy6SZYxOvHxCcjk2fkw6UmPU6/j/nQlj2lfOAgNVKuDLothIxzi8pndB8Jju
 KktE5HJqUUMXePkAYIxEQ0mMc8Po7tuXdejgPMwgP7x65xtfEqI0RuzbUioFltsp1jUaRwQZ
 MTsCeQDdjpgHsj+P2ZDeEKCbma4m6Ez/YWs4+zDm1X8uZDkZcfQlD9NldbKDJEXLIjYWo1PH
 hYepSffIWPyvBMBTW2W5FRjJ4vLRrJSUoEfJuPQ3vW9Y73foyo/qFoURHO48AinGPZ7PC7TF
 vUaNOTjKedrqHkaOcqB185ahG2had0xnFsDPlx5y
In-Reply-To: <aYTFZv9Mf_FqWM_k@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/5/26 08:29, Sean Christopherson wrote:
> No, this isn't the explanation.  I found the explanation in the pseudocode for
> SEAMRET.  The "successful VM-Entry" path says this:
> 
>   current-VMCS = current-VMCS.VMCS-link-pointer
>   IF inP_SEAMLDR == 1; THEN
>     If current-VMCS != FFFFFFFF_FFFFFFFFH; THEN
>       Ensure data for VMCS referenced by current-VMC is in memory
>       Initialize implementation-specific data in all VMCS referenced by current-VMCS
>       Set launch state of VMCS referenced by current-VMCS to “clear”
>       current-VMCS = FFFFFFFF_FFFFFFFFH
>     FI;
>     inP_SEAMLDR = 0
>   FI;

Yes, in version 002 of the spec. It wasn't there in 001.

The basic problem is that the SEAM VMCSes need to get flushed when the
TDX module is being loaded. The TDX module never loads itself, thus the
"inP_SEAMLDR == 1" check. It sounds like there was already an existing
thing in microcode to just flush VMCSes and invalidate "current-VMCS".

It was much easier for microcode to just jump over to that existing
thing than to surgically target the SEAM VMCSes, or somehow avoid
zapping "current-VMCS". It makes total sense for the microcoders to have
gone this route.

I'm seeing if it can get changed back to the 001 version so we just
don't even have to deal with this whole mess.
