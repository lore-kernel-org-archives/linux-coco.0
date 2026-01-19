Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F6D394496;
	Mon, 19 Jan 2026 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840896; cv=none; b=iNNruLv+VukSqxRi48L2I5Iuut2TO6Fp140iz3G7XBda7xhlSwiTXx2oTmgycZkwgRaStkItMp5DHJu1Pb+TRIn8rJ7K0ZBkcwXTUuYsS40209fbZIOyxuiQJNjAaWfetsKWJbRMfkdgJjWLWXAcl8RkMB2P64iCk4YEH14DNSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840896; c=relaxed/simple;
	bh=U9Zf5iRxcWlEhJNllVETedoflM2+yscJ7heSjFo20pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8vp+ziqBF7tNEOczlmNMdaKFbnK583zlYNrWK9YzlYhSV7Ln/9luwkgzTLIjBPk40DCsCuvyWsnSG2E5MeNJQz+7lHFWY+cs7d8vuAvpX+iUjrWY174SXZkHEvqwSkYydtuOgiHctNCoy/WzW2UoHLz9by3MBUBOxdQarRRGSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09C97497;
	Mon, 19 Jan 2026 08:41:26 -0800 (PST)
Received: from [10.57.8.47] (unknown [10.57.8.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65C323F632;
	Mon, 19 Jan 2026 08:41:29 -0800 (PST)
Message-ID: <7cb5b5a7-90aa-4b78-aff3-f88073e72b60@arm.com>
Date: Mon, 19 Jan 2026 16:41:27 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: kernel test robot <lkp@intel.com>, Salman Nabi <salman.nabi@arm.com>,
 vvidwans@nvidia.com, sudeep.holla@arm.com, mark.rutland@arm.com,
 lpieralisi@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260119122729.287522-2-salman.nabi@arm.com>
 <202601200007.GVZIjoCx-lkp@intel.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <202601200007.GVZIjoCx-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/01/2026 16:29, kernel test robot wrote:
> Hi Salman,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on soc/for-next]
> [also build test WARNING on linus/master v6.19-rc6 next-20260116]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Salman-Nabi/firmware-smccc-add-support-for-Live-Firmware-Activation-LFA/20260119-203221
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> patch link:    https://lore.kernel.org/r/20260119122729.287522-2-salman.nabi%40arm.com
> patch subject: [PATCH 1/1] firmware: smccc: add support for Live Firmware Activation (LFA)
> config: arm-sp7021_defconfig (https://download.01.org/0day-ci/archive/20260120/202601200007.GVZIjoCx-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200007.GVZIjoCx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601200007.GVZIjoCx-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/firmware/smccc/lfa_fw.c: In function 'get_nr_lfa_components':
>     drivers/firmware/smccc/lfa_fw.c:179:16: error: variable 'reg' has initializer but incomplete type
>       179 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                ^~~~~~~~~~~~~~~~~~
>>> drivers/firmware/smccc/lfa_fw.c:179:43: warning: excess elements in struct initializer

Ah, yes, arm_smccc_1_2_regs is only defined for arm64. We rely on v1.2, 
and the LFA spec actually means that this means AArch64 only right at 
the beginning (chapter 2).
So we need an additional dependency on ARM64 in the Kconfig entry.

Cheers,
Andre



>       179 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                           ^
>     drivers/firmware/smccc/lfa_fw.c:179:43: note: (near initialization for 'reg')
>     drivers/firmware/smccc/lfa_fw.c:179:35: error: storage size of 'reg' isn't known
>       179 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                   ^~~
>     drivers/firmware/smccc/lfa_fw.c:184:9: error: implicit declaration of function 'arm_smccc_1_2_invoke'; did you mean 'arm_smccc_1_1_invoke'? [-Wimplicit-function-declaration]
>       184 |         arm_smccc_1_2_invoke(&reg, &reg);
>           |         ^~~~~~~~~~~~~~~~~~~~
>           |         arm_smccc_1_1_invoke
>>> drivers/firmware/smccc/lfa_fw.c:179:35: warning: unused variable 'reg' [-Wunused-variable]
>       179 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                   ^~~
>     drivers/firmware/smccc/lfa_fw.c: In function 'lfa_cancel':
>     drivers/firmware/smccc/lfa_fw.c:194:16: error: variable 'reg' has initializer but incomplete type
>       194 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                ^~~~~~~~~~~~~~~~~~
>     drivers/firmware/smccc/lfa_fw.c:194:43: warning: excess elements in struct initializer
>       194 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                           ^
>     drivers/firmware/smccc/lfa_fw.c:194:43: note: (near initialization for 'reg')
>     drivers/firmware/smccc/lfa_fw.c:194:35: error: storage size of 'reg' isn't known
>       194 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                   ^~~
>     drivers/firmware/smccc/lfa_fw.c:194:35: warning: unused variable 'reg' [-Wunused-variable]
>     drivers/firmware/smccc/lfa_fw.c: In function 'call_lfa_activate':
>     drivers/firmware/smccc/lfa_fw.c:220:16: error: variable 'reg' has initializer but incomplete type
>       220 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                ^~~~~~~~~~~~~~~~~~
>     drivers/firmware/smccc/lfa_fw.c:220:43: warning: excess elements in struct initializer
>       220 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                           ^
>     drivers/firmware/smccc/lfa_fw.c:220:43: note: (near initialization for 'reg')
>     drivers/firmware/smccc/lfa_fw.c:220:35: error: storage size of 'reg' isn't known
>       220 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                   ^~~
>     drivers/firmware/smccc/lfa_fw.c:220:35: warning: unused variable 'reg' [-Wunused-variable]
>     drivers/firmware/smccc/lfa_fw.c: In function 'prime_fw_image':
>     drivers/firmware/smccc/lfa_fw.c:290:16: error: variable 'reg' has initializer but incomplete type
>       290 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                ^~~~~~~~~~~~~~~~~~
>     drivers/firmware/smccc/lfa_fw.c:290:43: warning: excess elements in struct initializer
>       290 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                           ^
>     drivers/firmware/smccc/lfa_fw.c:290:43: note: (near initialization for 'reg')
>     drivers/firmware/smccc/lfa_fw.c:290:35: error: storage size of 'reg' isn't known
>       290 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                   ^~~
>     drivers/firmware/smccc/lfa_fw.c:290:35: warning: unused variable 'reg' [-Wunused-variable]
>     drivers/firmware/smccc/lfa_fw.c: In function 'activation_pending_show':
>     drivers/firmware/smccc/lfa_fw.c:360:16: error: variable 'reg' has initializer but incomplete type
>       360 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                ^~~~~~~~~~~~~~~~~~
>     drivers/firmware/smccc/lfa_fw.c:360:43: warning: excess elements in struct initializer
>       360 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                           ^
>     drivers/firmware/smccc/lfa_fw.c:360:43: note: (near initialization for 'reg')
>     drivers/firmware/smccc/lfa_fw.c:360:35: error: storage size of 'reg' isn't known
>       360 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                   ^~~
>     drivers/firmware/smccc/lfa_fw.c:360:35: warning: unused variable 'reg' [-Wunused-variable]
>     drivers/firmware/smccc/lfa_fw.c: In function 'pending_version_show':
>     drivers/firmware/smccc/lfa_fw.c:434:16: error: variable 'reg' has initializer but incomplete type
>       434 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                ^~~~~~~~~~~~~~~~~~
>     drivers/firmware/smccc/lfa_fw.c:434:43: warning: excess elements in struct initializer
>       434 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                           ^
>     drivers/firmware/smccc/lfa_fw.c:434:43: note: (near initialization for 'reg')
>     drivers/firmware/smccc/lfa_fw.c:434:35: error: storage size of 'reg' isn't known
>       434 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                   ^~~
>     drivers/firmware/smccc/lfa_fw.c:434:35: warning: unused variable 'reg' [-Wunused-variable]
>     drivers/firmware/smccc/lfa_fw.c: In function 'update_fw_images_tree':
>     drivers/firmware/smccc/lfa_fw.c:586:16: error: variable 'reg' has initializer but incomplete type
>       586 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                ^~~~~~~~~~~~~~~~~~
>     drivers/firmware/smccc/lfa_fw.c:586:43: warning: excess elements in struct initializer
>       586 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                           ^
>     drivers/firmware/smccc/lfa_fw.c:586:43: note: (near initialization for 'reg')
>     drivers/firmware/smccc/lfa_fw.c:586:35: error: storage size of 'reg' isn't known
>       586 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                   ^~~
>     drivers/firmware/smccc/lfa_fw.c:586:35: warning: unused variable 'reg' [-Wunused-variable]
>     drivers/firmware/smccc/lfa_fw.c: In function 'lfa_init':
>     drivers/firmware/smccc/lfa_fw.c:619:16: error: variable 'reg' has initializer but incomplete type
>       619 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                ^~~~~~~~~~~~~~~~~~
>     drivers/firmware/smccc/lfa_fw.c:619:43: warning: excess elements in struct initializer
>       619 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                           ^
>     drivers/firmware/smccc/lfa_fw.c:619:43: note: (near initialization for 'reg')
>     drivers/firmware/smccc/lfa_fw.c:619:35: error: storage size of 'reg' isn't known
>       619 |         struct arm_smccc_1_2_regs reg = { 0 };
>           |                                   ^~~
>     drivers/firmware/smccc/lfa_fw.c:619:35: warning: unused variable 'reg' [-Wunused-variable]
> 
> 
> vim +179 drivers/firmware/smccc/lfa_fw.c
> 
>     176	
>     177	static unsigned long get_nr_lfa_components(void)
>     178	{
>   > 179		struct arm_smccc_1_2_regs reg = { 0 };
>     180	
>     181		reg.a0 = LFA_1_0_FN_GET_INFO;
>     182		reg.a1 = 0; /* lfa_info_selector = 0 */
>     183	
>     184		arm_smccc_1_2_invoke(&reg, &reg);
>     185		if (reg.a0 != LFA_SUCCESS)
>     186			return reg.a0;
>     187	
>     188		return reg.a1;
>     189	}
>     190	
> 

