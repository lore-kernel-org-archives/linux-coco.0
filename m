Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049AD8BE8
	for <linux-coco@lists.linux.dev>; Fri, 11 Oct 2024 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728610255; cv=none; b=QJNq0DHi30P7yEXvEmoCfIeHVyprlVMMm5+eZ7HOj6jVTzbCQzIZnJNhQsb3qFpvqXpZgt+Krf6R86T+9JFVbWuPOV8YoCgkqKWWp5QitTryAjnxU7hsEkAHyFJb/9WMXTgSj+rruQz/iQiSpo0Ztl2Gd/ClXWMFGKBDma3SfV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728610255; c=relaxed/simple;
	bh=SoFr2Uk73M3n7QVtNXQOtS696p9j0c0ldjUt/ArdYPA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AZFtmbjl67EUhFncGFoftMGVNuoQvNAN7lnzPepatEjnB+/azRApvHHsJe8pxiSww5sY8w32kVbgnY6VTbHFIvjF8gylL774DlEdcynTmiWpUumyHoSrYm5gk+AIOJ9idxcMlHmSbjLEWG4QEaQo2YSpHgE6zZjy+g31694Rc+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkpi5tUE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkpi5tUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728610254; x=1760146254;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=SoFr2Uk73M3n7QVtNXQOtS696p9j0c0ldjUt/ArdYPA=;
  b=kkpi5tUEZeo3avhVQOlsDb0rCGokvOf7mxs5KMgGk15cmdJjOvjs/3dp
   kLoeImDA4NVX9UCSyvIQw0tN2iM+7zvQOe2kQgsDSZoljgu053i/Q+qU8
   rkUhZU4yndNBkPym1N1Wrg6xvU3bj6jWI5wxOEPHDdgbHJwWGw0uDqmGX
   lmlH/lbPgYQU9hhzIcUAuobzVpt5YlQ2tmiivCvyNGZ4Fo+MU13CJZzjQ
   IWc0SakZ/kJ67rXfejazRx8LU2FOrb6fw5lQdEn68apfoyZ0lZMoApmHc
   5It9L10klQNqIoGIMeD6nSEIi/SZ6T22raSGIFrfRdPJz6yfvI0mrLSIr
   A==;
X-CSE-ConnectionGUID: SAGEAcNIQbKvn6weDn2m/Q==
X-CSE-MsgGUID: wI+R4I5ZSRyW9G1D7FGIdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="15623329"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="15623329"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 18:30:53 -0700
X-CSE-ConnectionGUID: M4hFXKFrTMOYIZwSaYDmCg==
X-CSE-MsgGUID: XhqhavwrQXmcHQTZnBZbRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="81564379"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 18:30:49 -0700
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
In-Reply-To: <037801d9-8923-4d49-8423-072fd7c73069@redhat.com> (David
	Hildenbrand's message of "Thu, 10 Oct 2024 14:40:47 +0200")
References: <20241010074726.1397820-1-ying.huang@intel.com>
	<037801d9-8923-4d49-8423-072fd7c73069@redhat.com>
Date: Fri, 11 Oct 2024 09:27:16 +0800
Message-ID: <87o73ra0p7.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

David Hildenbrand <david@redhat.com> writes:

>>   extern u64 max_mem_size;
>>     extern int mhp_online_type_from_str(const char *str);
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index 621ae1015106..c4769f24b1e2 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -1305,6 +1305,11 @@ int try_online_node(int nid)
>>   	return ret;
>>   }
>>   +int __weak arch_check_hotplug_memory_range(u64 start, u64 size)
>> +{
>> +	return 0;
>> +}
>
> BTW, I remember that "__weak" doesn't always behave the way it would
> seem, which is the reason we're usually using
>
> #define arch_check_hotplug_memory_range arch_check_hotplug_memory_range
>
> #ifndef arch_check_hotplug_memory_range
> ...
> #endif
>
>
> Not that I remember the details, just that it can result in rather
> surprising outcomes (e.g., the wrong function getting called).

I can replace __weak with #define/#ifndef.

However, it appears that "__weak" is still widely used now.

$ grep __weak -r mm kernel init | wc -l
231

--
Best Regards,
Huang, Ying
