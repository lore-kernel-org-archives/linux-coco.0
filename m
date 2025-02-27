Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1271A317C
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 19:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740684642; cv=none; b=JuKDzGE+q32OiBDrY/j9hvOSGULXwk2aSlAOX2hl2uIGqrMQoBIgw+TxI8dd22plavyXxT/K+LMlJiR6QawCdWN8BKMoKgJCx6a7HGK/a+Nzaq/qe8Lw7NN7SHmyl0UTeSUXVkR9JGHMHbPX9jVLTHKhDlUJki0ilwWu5ppf2Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740684642; c=relaxed/simple;
	bh=8UOZQyyIStF2th0oM905lNc0OKLXsfylKuIzCLeIfU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBJqLarDQO56RLcrzShKPw29nAv/x9x6JPjnnosvhY9UI94G4kfVZXOthwvRWqUWT5ZdH6A7BPZYxiR9k6clCrJuHJFSilGTmSJO6qe+sGvNfCoI506Ux90ZzYQoYlJ+ldIpLMM4o6THpELjWNiRngw1C76RGkFAcp0joQZiHbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aK74Z20Z; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aK74Z20Z"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-544043a21eeso1208e87.1
        for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 11:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740684639; x=1741289439; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxUdrSt37LrgTdQsNrS2fDoFyqBqPlpse33rB5xti5s=;
        b=aK74Z20ZRPe11yPA0NgCOTluSLt2smDkJMVYoUEJqmjNhc1OgNpW9Mf9p3cKcQy6w0
         nw44nrgLw0VZ84c5649p56HC4NjDP9FY0MdUQTx1q66raPe2Gm41Tbb0ow6HExBDSoLW
         lgXZo8efXAhM1c+y8hTY49Gb+xC5iFbdBPtTyZFEk4f7B2C/QGnuNhW0l97vDO4d0zjX
         R5keRpdNmLPFU/gzmqJdrkZUyvvB0Av8oMoqgjQlh+k7lf4SM+7o5CxkltDQZZ3ohUp3
         dqubPxSXpt5oagrVIm1B9gq6aKzzXmvwgiLeUlpbQhEHB9vnIPh3/6TYTvpfilWfx+OS
         WQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740684639; x=1741289439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxUdrSt37LrgTdQsNrS2fDoFyqBqPlpse33rB5xti5s=;
        b=NbgnNPOz9dLP7JsF/y0RTcesYOjykqyvSbrTL+/JfA9UKVKgH1jKMbPW1DuSnAcg42
         Qea1WhSTRAX2FW1iI9gllk4LTSI+olFuRGaPkd+bYbuRQoYwfWWW/4vkoLIyVIWmNrv1
         CMIq90JXAMcdoKEQ+BFgOOLoN8W2hiL5L6TO4ohmKuuaefXcjIRsrufHRn1EmSFOlp1y
         A78JrBxVAs9vXq4xZh7WV7J0r75zRI+5x1gXlGrrinZWpyZXGt54Vb4B+kzNSP8uGZo4
         vy7Bgh6+Jxqk5ZvxvDozxGMKcxm0ZWCBJIURoSCLT52f5NM8wxbOgqVYr1F5n37YJiZY
         TV+A==
X-Forwarded-Encrypted: i=1; AJvYcCXP5+725VEH97T+K4xze5N1wCVp+o55d6m+BsSt0QM+82M1Ekkz6ZjvjCkuYGvGqLbOxpfpIqzkpANJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwbtVhDkXwopLrlfm+WBhPvo1Jja/k0a4PDiPbYyZehIeI9yu75
	bdMo9U3F4IkJmbQEfagVjsbGdjzedKamlX9yj9ZvDpyvbYvk9tbOzCHwjqUSIgJyGDn2zuIev4S
	ZWWq6jsx2g6063Ylr6SApzLAMynVMRc2hVSCj
X-Gm-Gg: ASbGnctolBWi88b4PUwFQdBlgw/oG7pBoc2e94vQuSpkHaogLJW5WOC2AYOdSMhm6w3
	3CCT+LwnY12/pbFO8ow2Ox5usgKnGX3oPuDaiERnK/tMYGWFVuZpMKaL6F1cU10xJwdpYR1Tqi6
	i4PAqC1xCOR7hfUZwjHow3k3CjGhz/uC6g1M5p4l+2
X-Google-Smtp-Source: AGHT+IGeAWqnGUQpzKOe+zSYlqhnj7nPf3RxfEHYv8obi8+zQSmDCtjuRvMXctYHZHy0zrx21F7TOUJhLatVjAxZhyM=
X-Received: by 2002:a05:6512:e8c:b0:545:23b0:4247 with SMTP id
 2adb3069b0e04-5494d733e9emr31508e87.2.1740684638497; Thu, 27 Feb 2025
 11:30:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225004704.603652-3-vannapurve@google.com> <202502272346.iiQ6Dptt-lkp@intel.com>
In-Reply-To: <202502272346.iiQ6Dptt-lkp@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 27 Feb 2025 11:30:26 -0800
X-Gm-Features: AQ5f1JpO7zRYi6DzcSKnE4B4trMunnGetNndbYlpp3x9XD6ERrRXOsIOqVyyKTY
Message-ID: <CAGtprH_+GAVd1UmeCvT-JHq3OCn_3aTqwyjTRWNtLpoJPPfLPQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] x86/tdx: Fix arch_safe_halt() execution for TDX VMs
To: kernel test robot <lkp@intel.com>
Cc: dave.hansen@linux.intel.com, kirill.shutemov@linux.intel.com, 
	jgross@suse.com, ajay.kaher@broadcom.com, ak@linux.intel.com, 
	tony.luck@intel.com, thomas.lendacky@amd.com, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, hpa@zytor.com, pbonzini@redhat.com, seanjc@google.com, 
	kai.huang@intel.com, chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, 
	afranji@google.com, kees@kernel.org, jikos@kernel.org, peterz@infradead.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 8:25=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Vishal,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/x86/core]
> [also build test ERROR on tip/master linus/master v6.14-rc4 next-20250227=
]
> [cannot apply to tip/x86/tdx tip/auto-latest]
> ...
> All errors (new ones prefixed by >>):
>
>    In file included from arch/x86/kernel/process.c:6:
>    In file included from include/linux/mm.h:2224:
>    include/linux/vmstat.h:504:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      505 |                            item];
>          |                            ~~~~
>    include/linux/vmstat.h:511:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      512 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
> >> arch/x86/kernel/process.c:937:32: error: use of undeclared identifier =
'tdx_halt'; did you mean 'tdx_init'?
>      937 |                 static_call_update(x86_idle, tdx_halt);
>          |                                              ^~~~~~~~
>          |                                              tdx_init

Will fix this in the next version.
