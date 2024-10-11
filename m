Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9D020C49B
	for <linux-coco@lists.linux.dev>; Fri, 11 Oct 2024 12:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648078; cv=none; b=UQ2Gbw1+g2yqt8MmZCADdoKi83vhgBY0wBcO1wG017A66bKAudx32r4hngoSmqhwcGpwu5T+gNj0ibORkRGZZvMXatBCZmdQLyXw4sok3uJTlF6sw4xFMHC9oqq8RfciNaP3Lr7IoL7v+Tj8eXLGhtYD5AxMBQ5BVdsni9dYSfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648078; c=relaxed/simple;
	bh=On39dKXOMppwLZCYpokNty+xpqfFYIk4OCDgpyUSYYY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L9KSP7/w373eUNn5pz/Nr9VbSWEjctu6WlGwlzwgXPYn5EQDnql2njyPcqzk85HzZ/SPgYDK0P+kgdDs1WwOTZbniApQhJvxt5VbAahnOaCRO3nnEsN31/jtWYcC0teLOKaazGM+VyzHSp7Y8gOkq4dAMVZO69fjJDalPRM4+R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYuu0YC/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYuu0YC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728648076; x=1760184076;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=On39dKXOMppwLZCYpokNty+xpqfFYIk4OCDgpyUSYYY=;
  b=JYuu0YC/yp63GFptY0fpgaFbAjS/gmzDNthuq8uVAZhZTOOQubbhuj0H
   BBjy/jKb86ljcD7ow8lAGePNoHR7PKMv5uZV2qSh1IhhLudWZyH/eCyJF
   S/ErfP7e2Nijms7iZ5fDEdK5PWstwRdnCRxqOTKhAjO/1zNpFKrkWurbh
   elAeuDLzJ8TB1lJEVh+cLsPSrU0qNrcqWAim36wC4oxxKzv+/5X7Z/Gkd
   5Go2BDPmvwIvtcsw+ysK+MH2LuKCapl01Pd4fDYYEAembo2QiYgQkOTAp
   gDQTqKWCP35MJigi6n0mdecYw1eL41VoUwMSWp5dgnJcMkl5DU+zUBxKr
   w==;
X-CSE-ConnectionGUID: xlBcnEu9SjWzR8QLOIHfEA==
X-CSE-MsgGUID: v7CVX8qfRG24jA1A1fakjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38613804"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="38613804"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 05:01:15 -0700
X-CSE-ConnectionGUID: DHw0voemSQ+9xLlLMZ0flw==
X-CSE-MsgGUID: ShXFkEczQUuShiAFt8SrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77196039"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 05:01:12 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,  Ingo Molnar <mingo@redhat.com>,
  Borislav Petkov <bp@alien8.de>,  Dave Hansen
 <dave.hansen@linux.intel.com>,  "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>,  x86@kernel.org,
  linux-coco@lists.linux.dev,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  Dan Williams <dan.j.williams@intel.com>,
  Kai Huang <kai.huang@intel.com>,  "H. Peter Anvin" <hpa@zytor.com>,  Andy
 Lutomirski <luto@kernel.org>,  Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH -V2] tdx, memory hotplug: Check whole hot-adding memory
 range for TDX
In-Reply-To: <50881635-092f-4940-b998-1532d5c9f83a@redhat.com> (David
	Hildenbrand's message of "Fri, 11 Oct 2024 11:53:13 +0200")
References: <20241010074726.1397820-1-ying.huang@intel.com>
	<037801d9-8923-4d49-8423-072fd7c73069@redhat.com>
	<87o73ra0p7.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<71dc3853-45a6-4fa5-b3c6-b165e0ab6a1b@redhat.com>
	<87v7xz81jk.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<4bc038a4-e8ff-4441-acb1-63fcb3dc9068@redhat.com>
	<50881635-092f-4940-b998-1532d5c9f83a@redhat.com>
Date: Fri, 11 Oct 2024 19:57:39 +0800
Message-ID: <87r08m97ik.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

David Hildenbrand <david@redhat.com> writes:

> On 11.10.24 11:48, David Hildenbrand wrote:
>> On 11.10.24 10:51, Huang, Ying wrote:
>>> David Hildenbrand <david@redhat.com> writes:
>>>
>>>> On 11.10.24 03:27, Huang, Ying wrote:
>>>>> David Hildenbrand <david@redhat.com> writes:
>>>>>
>>>>>>>      extern u64 max_mem_size;
>>>>>>>        extern int mhp_online_type_from_str(const char *str);
>>>>>>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>>>>>>> index 621ae1015106..c4769f24b1e2 100644
>>>>>>> --- a/mm/memory_hotplug.c
>>>>>>> +++ b/mm/memory_hotplug.c
>>>>>>> @@ -1305,6 +1305,11 @@ int try_online_node(int nid)
>>>>>>>      	return ret;
>>>>>>>      }
>>>>>>>      +int __weak arch_check_hotplug_memory_range(u64 start, u64 size)
>>>>>>> +{
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>
>>>>>> BTW, I remember that "__weak" doesn't always behave the way it would
>>>>>> seem, which is the reason we're usually using
>>>>>>
>>>>>> #define arch_check_hotplug_memory_range arch_check_hotplug_memory_range
>>>>>>
>>>>>> #ifndef arch_check_hotplug_memory_range
>>>>>> ...
>>>>>> #endif
>>>>>>
>>>>>>
>>>>>> Not that I remember the details, just that it can result in rather
>>>>>> surprising outcomes (e.g., the wrong function getting called).
>>>>> I can replace __weak with #define/#ifndef.
>>>>> However, it appears that "__weak" is still widely used now.
>>>>
>>>> Probably better to avoid new ones.
>>>
>>> Sure.  Will do that in the future versions.
>>>
>>>> See also
>>>> Documentation/dev-tools/checkpatch.rst
>>>>
>>>> I assume checkpatch.pl should complain as well?
>>>
>>> Double checked again.  It doesn't complain for that.
>> Indeed, it only checks for usage of "weak" for *declarations*. So
>> maybe
>> it's fine after all and I am misremembering things. So just leave it as
>> is for the time being.
>> 
>
> For completeness, this is the issue I remembered:
>
> commit 65d9a9a60fd71be964effb2e94747a6acb6e7015
> Author: Naveen N Rao <naveen@kernel.org>
> Date:   Fri Jul 1 13:04:04 2022 +0530
>
>     kexec_file: drop weak attribute from functions
>          As requested
>     (http://lkml.kernel.org/r/87ee0q7b92.fsf@email.froward.int.ebiederm.org),
>     this series converts weak functions in kexec to use the #ifdef approach.
>          Quoting the 3e35142ef99fe ("kexec_file: drop weak attribute
>         from
>     arch_kexec_apply_relocations[_add]") changelog:
>          : Since commit d1bcae833b32f1 ("ELF: Don't generate unused
>         section symbols")
>     : [1], binutils (v2.36+) started dropping section symbols that it thought
>     : were unused.  This isn't an issue in general, but with kexec_file.c, gcc
>     : is placing kexec_arch_apply_relocations[_add] into a separate
>     : .text.unlikely section and the section symbol ".text.unlikely" is being
>     : dropped.  Due to this, recordmcount is unable to find a non-weak symbol in
>     : .text.unlikely to generate a relocation record against.

Good to know this, Thanks!

--
Best Regards,
Huang, Ying
