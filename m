Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEA2423152
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896145; cv=pass; b=ZMGYLWBXiS+X+wRILqb8k35ZM0yoYnfWIXn8W5Z2lx67smHy+SQyPALatJg6Rc8Zqhc9jVz+9XRWNlUYvUKYNWqv921mT33yhyuCnD0D/LFIV4ABUJr+e6t3l48UcPk80Gz4IgVURMeY+tJ8GkN5x/ROTlP+dFhmVrt6kxbDPi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896145; c=relaxed/simple;
	bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpNBGxl7hNXYc6+ZfMEh2NCVA2LBp5JDtpqIw0mHMcWSg7e2YQHP0FlJSzDNveRCdfqHBqPLqpv3S+WpTStOqZH90yzLox4EzA3hKUF7B4pdyVGy12TLTL0JVexuhRSeJXePKmTDJS6v//p59bOpzPK5Rrd59WSLkkiPZ6Yy85k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=smfr06/l; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="smfr06/l"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-133466cf955so31400475c88.0
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 08:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779896143; cv=none;
        d=google.com; s=arc-20240605;
        b=EsYgOaPDqVnuAMJJ1WUux1RBII82VzVI/HhiFMsDc7F0U7FmnNd8FKFV30Jbmoj+iN
         D3NIRcppet6xnCBWUXHma+ldPv9zuIHrpz66WShxHvGzfspl68cfspomfz4Alza3ayH0
         Mfw9oELoJoBLQdrJ1NBL/fdes+MkKZKWfXqlWjZVIooSXi+aH/xoqGD+gf2OMtN0Ly6Y
         IODC2+7vp8nV68QSGRZBbxxEPVmRxvhijeC5HXzj9Gn8WwcJVl5bQ2A+7eIVdc3YMfrI
         FS1F/0WrJwe4U+0POerYs72XeW5FW4gHymcDwBThvlEN1sSHLaLGpmnikXOpmKp0llyq
         ELHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
        fh=GH72Wp2zai2KwRxi1+3Utu8Mequb/8yig84ynZUzNZo=;
        b=JkVVAH4zWvfmMkf12QtB16mM/vKLq+uYwgi+5NmJ1kQqi+6IAY6Gkwbxqte55pHGKo
         mUZ8qSGfLti64qr14ai3sL9wUMeDJk6dE7j5rzRuHlHy8kN8rrAIS10z1pcDapzl66YJ
         yIpmeHFXRparqaLWN75ZezNXwer0pKA51RR4sC7mA9ZyAK1KVKuorDXcbnBRXZbwWJQs
         u4zM1cYBAnktL+ErKB72+N//Diolr4gNGFyc9lOK3mt18bV+dKQQOt1ZSPZdvw/+h2AK
         rhn+fuOWYwTHuJUyoYAzL7EsqW/xPnczgAKz3++jQ2ZdyPAb+CINDpoFXPay5E/K/EDx
         O2/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779896143; x=1780500943; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
        b=smfr06/lZCpkcTCCsErZaSi5f77TX8K7JijwpMOlLpWgtnzcsVr9nWrwGZSOanz26C
         5oYC8mFmG/9IM/9A4KRzUEk/Vou7H3HWK149Y97EQZBfiRXgVeO7dTvvOhAkxnuPEQnm
         tRng7UL82X2M/pkxwA1g2GkSVG8mXF1Y43bF9MV/jhyvYl/wpyEfN/Ks6c+zLWfKvxUz
         GsGKDVg4EtnQJGMNwU/XprmcNI3tXrIM2YlYPTiGWf49neZ5YMYEePbzmkqGxVwscryy
         eMXFd1/bP5z3D1Shgxa+VccziHsDHMuo1vCIpSVAM61VZqUZgd5uN9pnAogqwhO6SKJC
         1TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896143; x=1780500943;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/34ZEKo4WKYSNfKeZJyC5zY+tHi9Bq+q7x5tIuisplU=;
        b=L7N9Lx0KhkkYP5P0l/UQV9/fspVAEXlEHscjFDivKf7czrEoXcGkSh7dIOcsHji7+X
         kwEGHlxeI5bMlswGTURoFsRkKaxYjfyvFyWXcaZkmPyDCcEd3AcC9NkofsvaoUlTn2Zc
         7NPjXE4tmYv7GfBYh/uqCEq6HBTExBZoo1DbMjI2zS5KsNkCFI6hbqGvHBimFGxYSFUL
         lrgNeTecPThCx/sYI/35iRxD/LUDywW802OEg1XGjz+AgESpBQwDG36tzRaj1GF+nLpE
         p8vGi0AkwGxk0mEZdFPS4UislsN502k3lBEWZ0Sa6ggRv6vOr0ujygI0IIDN0GueQJ0y
         JBKw==
X-Forwarded-Encrypted: i=1; AFNElJ/W4H7bvjnShLAjvzVOT8IOJ3IPSCeLpzzMDxMCk+LoSW1EKw8Dv8thWoNLGcAmBncYjs/+bcs0NGl6@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmj7sqqSN0u5Op4EsIui1wuP/tEHwbs7ZkRy7+xPeqk3rBcT1u
	kErg1F2k+WlXBYeQfGX8hVns7QygtJOB0TapMGB8uISDZItZAFjQzeCLJi+S3PduX00KLt/na3k
	R3BCz2FCbnOLvAd5jA4e7z34jeBNn5PEvQUWWKQCt
X-Gm-Gg: Acq92OF3ysZm7RwE/Yo+Sh/yfnN26JjpTqw5dzow1cyN9KzFxvpMWCPD4xwtEc4zg2M
	VBscFTMnbj7a7nsY0LEfXiVka+k2xshAu/kRADpTfTqzyw213etXu6ykXwpYtod7F6j4pORV4/C
	G9QbEQRmKX1PKt3PSiVkDyc54Py7Gc6LYPMBDiN8fVgCFRDJBCf/vtUYS6Z3BB8cYwVHnZGpEEX
	tpINp44HPFrsBgPx6lcEATgDspWmBWQCblUoKo61N024yr4Pf4NDyZTORnxdDd+U03WPX6NCoDs
	TFI4T8Bmkv9hNB3hkWoKW532JLLS2MDx7SWckdfvHy8+3jjsjQ==
X-Received: by 2002:a05:7022:525:b0:128:d4be:7428 with SMTP id
 a92af1059eb24-1365fb4fa18mr10605757c88.19.1779896142087; Wed, 27 May 2026
 08:35:42 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 08:35:41 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 08:35:41 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgEZ9vCKkoMC11tVrueAonGWH2x6OeaYYxXGEj2gwHUaKw@mail.gmail.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
 <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
 <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
 <CA+EHjTzLCD-dU-euZKgzwyEr2ecPqFDNutcaHm2fCDGA+MHVXA@mail.gmail.com>
 <ag8JIlHjohAOC3-g@google.com> <CAEvNRgEZ9vCKkoMC11tVrueAonGWH2x6OeaYYxXGEj2gwHUaKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 May 2026 08:35:41 -0700
X-Gm-Features: AVHnY4JKedjh8K8TNAXOjoVnM50DfBi_EKpudGArqGboylLRPDEHJZCPBXCFwT4
Message-ID: <CAEvNRgH_ToNJunEmQKn3wED1aF02hwg3GrQcRwwZTs_bfPVf_w@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>
>>
>> Hmm, I wonder if we can figure out a way to consolidate some documentation,
>> because this is _exactly_ the same pattern that x86's host_pfn_mapping_level()
>> deals with (see its big comment below).
>>
>
> This would be great, are you thinking an actual comment or something in
> Documentation/?
>
> Perhaps we could iterate on this a little with me providing the newbie
> perspective. Do you want me to take a stab at writing something up?
>

Please see https://lore.kernel.org/all/20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com/T/!

>>
>> [...snip...]
>>
