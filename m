Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A760112DD9F
	for <linux-coco@lists.linux.dev>; Fri, 17 May 2024 15:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715959664; cv=none; b=Yj+qj2AkXmyipaBdZcut6+Hja69ES74nUCJOgJkLgrFMi+tFA64/St0MxYgAV6Pbce2E9AmF0VHD+11tZ+23ZIHy1TwrCF8SuYp+6OEKqO4VC+6nwEQsUvF+GVcoHy3KdPBbF+qhLo5anCoVBcLW/Ir9fbIm1d1QL8ULx8J+gv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715959664; c=relaxed/simple;
	bh=WAuIDB4DY45M+bVTlaGSn+0hYnImjNyHWBTEeeC9auI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNi8a3tvR94qgdFchiZvfIbt6aPqP5cyARFgZVWtl3zDndrK9of7C4h/8OfraoUHTxuC9PkiDSPIG1fo6VHZqKL0MZrVx97mhbLYl78zezGydTvlSaVtE1a8LpLkeLtX360B5uQjmF5RuEHn0XIzWsfdjzoFrQ7NRdLckOQwZn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GfnKq88c; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GfnKq88c"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a5a1054cf61so549043466b.1
        for <linux-coco@lists.linux.dev>; Fri, 17 May 2024 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715959661; x=1716564461; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYtZ7UWXlfZ7PHH7Ttm340cmOR2Qtx6Db26PJMdTdRc=;
        b=GfnKq88c5n76qaEPdxVcRA7BUaa1RbqKiwPNK8g8jsEd8CNzrJt5FeUXTSfy0LkmRd
         cscHWjue2W6WcDrPsDPAM3bCavm3HDG31Gu97pogmePTMElkC+jt9mt2Vg5EWeGxR2yx
         9kVe5QOlHiFkSLEeNkYizSBJNx7qULgN280URQwkEiLkgSa+dasadqnFuzLw+vPAPH6Y
         2A2KdDN2X8PbpO1LaRn9+WI3ihloQt0NTPn8ehyRhMsdbFI5a88NIUP5pKyaxMlZ+tQ5
         Rs4IVglQVUaDBpJKtV28aeiHilOP7Vw9Q06M1R9vvyltDqpswvwfpRrZ+ptfanEydKrN
         Gs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715959661; x=1716564461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYtZ7UWXlfZ7PHH7Ttm340cmOR2Qtx6Db26PJMdTdRc=;
        b=lwe3KQU2sW2XexJRWs0dp/penWxGHZfG3YWzZtNmJzoAOLAk5sS7dMSwWnEhttWfz9
         Bjcg/YMApSDRiODRh6Oe3fXfkcr6orWNOckg39WFTEt8xqeyNzZlvboviHx3jV+48ilc
         cjRwUzhQvZ2rliq9hYziGT1rw5ibmBIe7Q4nPeCCdnKVzYWtetEb6Dy2ENsOqij4vAGk
         0mGILlYeKopFRWZdpH4TzzlBXW3tjHt8uVkh6EDjGcyaSLFSW0SHimk8zt3eQ2wMYaxE
         AfsxLl+wuxoSRdmsuyXW6w41YDuBY3SO9pEz91sHeA85EoFbfrZOfjcMSCqarTKc+MVx
         a8UA==
X-Forwarded-Encrypted: i=1; AJvYcCXd14TJZahueBZ6rNPgsws3x4BP12SIBE7ZZX9WkpOIvbWOiPmb1uSC7sFv5JbElCt4IMeChB6nlD0l3ofb1CzRO7jNqcUIRTKB2Q==
X-Gm-Message-State: AOJu0YyFTZkCcjG/JrAXR/ezFKHQZQRT2ADjqLh/qXTMZHelrVq4z0wn
	r+6gNbN2jNcrNrbtdlmWhX1rdU4ugTdsgLuXLW+oe1ZRhrdVK1hxSuhhP/06ogg=
X-Google-Smtp-Source: AGHT+IEC/tVX5gdvgjdMELjSwKwhEoU8VoXbtk3n4tBN5yocUeBR05+5b+4MM+ubgkd9fbBP9nWoaQ==
X-Received: by 2002:a17:906:3551:b0:a53:ed1b:f3ba with SMTP id a640c23a62f3a-a5a2d572c03mr2111033966b.28.1715959661067;
        Fri, 17 May 2024 08:27:41 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c? (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de. [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17cc5sm1118947466b.205.2024.05.17.08.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 08:27:40 -0700 (PDT)
Message-ID: <c0067319-2653-4cbd-8fee-1ccf21b1e646@suse.com>
Date: Fri, 17 May 2024 17:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kvm/tdx: Save %rbp in TDX_MODULE_CALL
To: Dave Hansen <dave.hansen@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20240517121450.20420-1-jgross@suse.com>
 <ohvjbokpaxagc26kxmlrujab7cw3bekgi5ln7dt46cbsaxcqqh@crvqeohfazmf>
 <f63e1217-3dbe-458d-8c14-7880811d30ba@suse.com>
 <2a2guben2ysyeb43rzg6zelzpa57o24ufai3mi6ocewwvgu63l@c7dle47q7hzw>
 <03d27b6a-be96-44d7-b4ea-aa00ccab4cc5@suse.com>
 <fc0e8ab7-86d4-4428-be31-82e1ece6dd21@intel.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <fc0e8ab7-86d4-4428-be31-82e1ece6dd21@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.05.24 17:16, Dave Hansen wrote:
> On 5/17/24 07:44, Juergen Gross wrote:
>> Just another data point: Before using this machine I was testing on
>> another one with older firmware. That one really didn't support NOM_RBP_MOD
>> and I needed to build the kernel with CONFIG_FRAME_POINTER enabled to get
>> past the check you are mentioning above.
> 
> For all intents and purposes, the modules that intentionally clobber RBP
> don't support Linux. If buggy modules are accidentally clobbering RBP,
> we can debate how much the kernel should bend over to accommodate them,
> but my preference would be to ignore them.
> 
> I'd much rather put a deny list in the kernel than try to tolerate RBP
> clobbering universally.

Would you be fine with adding a new X86_FEATURE (or BUG?) allowing to switch
RBP save/restore via ALTERNATIVE, controlled by a command line option?

Or maybe by adding a new CONFIG_TDX_MODULE_CAN_CLOBBER_RBP (probably using
a shorter name) option?

TBH I'm slightly puzzled that the firmware I'm using could make it outside
Intel. I'm fearing this might happen again.


Juergen
