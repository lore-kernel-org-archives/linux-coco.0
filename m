Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D66F537F5
	for <linux-coco@lists.linux.dev>; Thu, 23 May 2024 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716443804; cv=none; b=bWGG0VwQ8czu5JU4CuKinoMCdTlzzhsFa6a9USfS0wOyFxVuHX0R0Wg2TfgD017/D7bg345v4lbjyp2JI0COkhGPcvIfG/HUtOwXhT3vPA3Z4qZn/OcLwds+mW2QxCME/lWGRmWBNc73vOGSytjyRZ++Gmg4kfmDyeaFlBxq07s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716443804; c=relaxed/simple;
	bh=QcmKNaeadCmfjBKwZ3A6bKHF9tzg4uverKrdNId0nt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ux35QNIw9ciDykAD3xjpslF2CSHaxIP/iiNHVShPZBuLhvPNU/1LQixzP1AsL/BnBvhhPbjY+tHspjKvGmYTYxsahJs8q7lkR5bUjvX+PFQbXq3mq90TR0IKktKnorc8OXACMMklqTCDfej8hxQjnIQWRLua+zu9srqV1cKwDf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YqlwuVym; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YqlwuVym"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5784315b1bfso881205a12.0
        for <linux-coco@lists.linux.dev>; Wed, 22 May 2024 22:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716443800; x=1717048600; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHJGxxygKhr7lKwiErxVT7iLb1jusJ405Lsp+K8U1jI=;
        b=YqlwuVymCXgNIQu44VF8xfZwW9i+7TfHPLrVhSMREYvQm8HPLAfvvC20t4mMeDjPEO
         1EGWldNPx5T+kJFd1iKZEguN4p804kdXjdBj+9IraAf/PviAfj8lACYVW2WT0mJgXaR7
         /dvvDrVU08lNY5ene2SDdj4SIjJ983NtFUvpoht9dK/XZhb62FlnJKad8gVTZhHiTFay
         6qVadAxxynoRuwSB56ol+nzFkpXidxtlrhz8piRgMVRGTkoD9iGYQ5/p1SAc8hAgqm4U
         hPk7nnzpnAgyIkO2wTJZ3r822C7wz3GoQQwZltrdp32bYkwxZopcLe1ZV+QXvh83SVUs
         z8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716443800; x=1717048600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHJGxxygKhr7lKwiErxVT7iLb1jusJ405Lsp+K8U1jI=;
        b=YbMWspMy0V3GMcdmNscID1CBbhKzSrUDQhpEomnCsCKCx0gHW92ZNnOjEdToMSRRXK
         03rsaAlKM0MMCZw0/Evb6W49b+Vn47VYpV2Jxd3kov+BlQvD+Fq5aBii7tSMWxzXDNnI
         kUNQzze5bCK40GvIcwky7iI+N9vsE1xtSKImnh+R5pFUVa4pziS1tSY21NNJESa8L3uP
         WuCwWScywLpffe0dPQNZpClpxZ5VS9nk+lQwBhyi58VQT73e7Gb483eE8NJ+2dqmvSMX
         lQBeITQ2qRiGTKvikvEQNuEVarHngp7BANAuXTIFO8LJfoCLxYch+3gW/6F7H4OvNDWK
         2H5w==
X-Forwarded-Encrypted: i=1; AJvYcCVdwgunOiRHIRjMqv7PL6r2PDEqW5QXfkrX0qoVBIFJ5/BsM5zoC2j74/xpWwvjwThP9KREsd7IZkI3da7Bdy1vJzMWg3xHAeCJrQ==
X-Gm-Message-State: AOJu0YzQwIeXZ1VYnFxMj4mvVCQzSr7Uf7uKs5OenbBdI+zMFidZGhOx
	6Ph0rrvAKLUEAF7jOt29vJHspuHt6vJrd1xbzTb3LMohTHPX4jFy9+TkZ9ik1vs=
X-Google-Smtp-Source: AGHT+IEhH1qf1RK/Jjcy07X+3I4SVHyPhSEyUaDXD1nJg4bAEZR/1Ei9QxnLdlNV2uc7jTf1E0aNYg==
X-Received: by 2002:a17:906:3858:b0:a62:2f13:a7d6 with SMTP id a640c23a62f3a-a623ea280d1mr93142966b.36.1716443800494;
        Wed, 22 May 2024 22:56:40 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2? (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de. [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a621b4e2988sm281054266b.79.2024.05.22.22.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 22:56:40 -0700 (PDT)
Message-ID: <e2d844ad-182a-4fc0-a06a-d609c9cbef74@suse.com>
Date: Thu, 23 May 2024 07:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kvm/tdx: Save %rbp in TDX_MODULE_CALL
To: "Huang, Kai" <kai.huang@intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "Hansen, Dave" <dave.hansen@intel.com>
Cc: "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "x86@kernel.org"
 <x86@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <20240517121450.20420-1-jgross@suse.com>
 <ohvjbokpaxagc26kxmlrujab7cw3bekgi5ln7dt46cbsaxcqqh@crvqeohfazmf>
 <f63e1217-3dbe-458d-8c14-7880811d30ba@suse.com>
 <2a2guben2ysyeb43rzg6zelzpa57o24ufai3mi6ocewwvgu63l@c7dle47q7hzw>
 <03d27b6a-be96-44d7-b4ea-aa00ccab4cc5@suse.com>
 <fc0e8ab7-86d4-4428-be31-82e1ece6dd21@intel.com>
 <c0067319-2653-4cbd-8fee-1ccf21b1e646@suse.com>
 <6df4fb48-9947-46ec-af5a-66fa06d6a83b@intel.com>
 <86ca805d-7ed7-47dd-8228-5e19fbade53f@suse.com>
 <f7edef9c-5eb5-4664-a193-3bb063674742@intel.com>
 <f02d9ebb-a2b3-4cb3-871b-34324d374d01@suse.com>
 <4b3adb59-50ea-419e-ad02-e19e8ca20dee@intel.com>
 <c7319c0614c9a644fa1f9b349bf654834b615543.camel@intel.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <c7319c0614c9a644fa1f9b349bf654834b615543.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.05.24 13:54, Huang, Kai wrote:
> On Fri, 2024-05-17 at 09:48 -0700, Dave Hansen wrote:
>> On 5/17/24 08:58, Juergen Gross wrote:
>>> On 17.05.24 17:52, Dave Hansen wrote:
>> ..
>>>> Once we have the specific TDX module version, we can go ask the folks
>>>> who write it if there were any RBP clobbering bugs.
>>>
>>> Okay, how to get the TDX module version?
>>
>> You need something like this:
>>
>>> https://lore.kernel.org/all/20231012134136.1310650-1-yi.sun@intel.com/
> 
> This one prints TDX version info in the TDX guest, but not host.
> 
> The attached diff prints the TDX version (something like below) during
> module initialization, and should meet Juergen's needs for temporary use:
> 
> [  113.543538] virt/tdx: module verson: major 1, minor 5, internal 0
> 
>>
>> .. and yeah, this needs to be upstream.
>>
> 
>  From this thread I think it makes sense to add code to the TDX host code
> to print the TDX version during module initialization.  I'll start to work
> on this.
> 
> One thing is from the spec TDX has "4 versions": major, minor, update,
> internal.  They are all 16-bit, and the overall version can be written in:
> 
> 	<Major>.<Minor>.<Update>.<Internal>, e.g., 1.5.05.01
> 
> (see TDX module 1.5 API spec, section 3.3.2 "TDX Module Version".)
> 
> The attached diff only prints major, minor and internal, but leaves the
> update out because I believe it is for module runtime update (yet to
> confirm).
> 
> Given there are 4 versions, I think it makes sense to implement reading
> them based on this patchset ...
> 
> https://lore.kernel.org/kvm/6940c326-bfca-4c67-badf-ab5c086bf492@intel.com/T/
> 
> ... which extends the global metadata reading code to support any
> arbitrary struct and all element sizes (although all 4 versions are 16-
> bit)?

With that I got:

[   29.328484] virt/tdx: module verson: major 1, minor 5, internal 0


Juergen

