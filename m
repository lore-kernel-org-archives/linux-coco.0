Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AFB3AC15
	for <linux-coco@lists.linux.dev>; Mon,  1 Dec 2025 01:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764553487; cv=none; b=Tykg7mTmhympko22lG5cYpcPfUZtEd/Bj8NKtsl1PjG3BtOVRDqjXPg7MRWdBVS2I+QmK80exhlhC6GOZxkgdz/x0a8gqqE/gWDBGZVD3PXLGVYNr6DHo+A0/DmmruAMNnyBgtOxmaltERsBDQAaDlgE7w/ui29ikL+fP/RVZu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764553487; c=relaxed/simple;
	bh=XXjK9G/6yVP87R7EES41vVBqCFfsiZh7q+9DV7eI7Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjHrvsLZfVpjQn+3FJhNiC38v4qbVxVNwXWNfSaq4biauuQzW33l8wDX91UFg7bmpCVAlnXJYgBaFj8Ca6bu72Hwum3oNulbXhRAwq+D3h0MuCjFL1+wVLY2BmzTh7zvn8K280yp7phdEq17P4/TCgk5YDskw+ikG08qwJVO9qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zcMu8cCY; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zcMu8cCY"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297e13bf404so618395ad.0
        for <linux-coco@lists.linux.dev>; Sun, 30 Nov 2025 17:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764553485; x=1765158285; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXjK9G/6yVP87R7EES41vVBqCFfsiZh7q+9DV7eI7Lg=;
        b=zcMu8cCYH5e00Pb0jqZw/cU3nneG+nFEbJCs+So9s9aWoNfn5mIGASPm8NdxWiAhWt
         DAK6vOOyb4Qb6/58MSTj1X0IMOCxCSTmm97ODtwBqXSduA4pUqIQsbq4oE+Y69RV43gB
         FJrBpXyrH1IuYT8SdpGphAsd6DlufMLcSvUm/x2wbcGE4UZoF+0/rJITx6c5HU6zXUZJ
         aezwL5S217TS0qtjD8fmYIsSA5LD03m37KU78mcdezQ83bMd1i9HbgdLquCX81kgGYyA
         svElMI+oVz3pC8M7/YKMz768swSW359ZgCfRPeoq+WgM4abbcMw2g9O+/JeiOAI8z+eu
         guKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764553485; x=1765158285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XXjK9G/6yVP87R7EES41vVBqCFfsiZh7q+9DV7eI7Lg=;
        b=IUvDwAf4NUWirzEPDVhg3tr4vsXAGMsJ5H3J8N86RpII7KRAKx4F/xsaa2QvTEVJ34
         NFERaLHmtE/vpoBli+JZ/u8us4b+F5FcSpPsLP+of1GFcTb5TsbNFvuPjLcYB6bhqAo9
         4WGhkOC4xMwMVtI9q4WRgo0fOd0Mz90ALws1eCwEmWf3IT3udPidNlP3f7F3wjbPfuoX
         eUPO6oUMwStJCAlUrjBSrUvwLwwoaE5AoZhPpDKOQbV+AlkT13L0P1Y3UaJqJ1vutVAx
         hizcx9q8HeLmzhgsAdDID3t68ULOI1DCHPFM4ipI9mvIAFQ1KthXp6tm4Fch9xhWghLn
         j/6g==
X-Forwarded-Encrypted: i=1; AJvYcCUE6HoOae3o3h1xhYKcpmHyEOAaU6cVfl7xXkcvrt2tFkiJmDk4O+CIlEsApHJDAnhpvziP4v1RKA/g@lists.linux.dev
X-Gm-Message-State: AOJu0YzLrBYLoN4KxZl/4lziaGvrc/bozmGUbpSAAWhr2FZz83Jetg16
	yzhXv7ZK16bjEUBF/Dw4udBd2jXqqW5rC0ZelspKxs/LoiHzfTqi4ZmfbF8vneGlJA4s2jg2GPi
	sL29rMIc0dlTBAMVz9Cygm1RAgtEmgdMpqt+hsqX8
X-Gm-Gg: ASbGnctbNz68PogB54KxSqXFGKDqZMqOqzk0kMm7i5t9v+dnZJefZ9wGem3HhTOkcxR
	ZY49EXIm5LdGAAd0hf7OPmk1PfjIWZivCQZjhYF/Lydu6fNlQNuOPUKoI7+XLVSjggi1vYvXuUi
	mGt84IZVFrI6FeKFaKFysSJICd6WGCPix0R1S0O5jfClPNj5phyPq/6POrcsGs/irxjTQsutX2n
	p925S4xiXF3sSLJPS7ThEj62nTnwOGdmAUPzUUTwmsQ65Fn+M6YX+MXUKPPIVtfJYQI0V03vyM+
	y4k+yCzz0m5/gB04Ot3f9OQOtiUT
X-Google-Smtp-Source: AGHT+IGVdSi91XFWN15kFPtoKM7WWzNM62D2CelcHdnZr/ei9NXQxiXmZnu+94y9qAsgrliHk3AbI8g7Jygo19QMqI4=
X-Received: by 2002:a05:7022:f902:10b0:119:e55a:808c with SMTP id
 a92af1059eb24-11dc9c5d1f3mr233294c88.9.1764553484484; Sun, 30 Nov 2025
 17:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251113230759.1562024-1-michael.roth@amd.com>
 <20251113230759.1562024-4-michael.roth@amd.com> <aR7bVKzM7rH/FSVh@yzhao56-desk.sh.intel.com>
 <20251121130144.u7eeaafonhcqf2bd@amd.com>
In-Reply-To: <20251121130144.u7eeaafonhcqf2bd@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Sun, 30 Nov 2025 17:44:31 -0800
X-Gm-Features: AWmQ_bkAp7M4RY7KhmAYC2tjQ6Yi5K4jbimiP8co_ZGiovyYBjjsYMzWDYgBcYo
Message-ID: <CAGtprH8gznGJ6VObk8aShBn_XnhwDoUzyzTkaDAe+MyiNsJ-NA@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: guest_memfd: GUP source pages prior to
 populating guest memory
To: Michael Roth <michael.roth@amd.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, 
	pbonzini@redhat.com, seanjc@google.com, vbabka@suse.cz, ashish.kalra@amd.com, 
	liam.merwick@oracle.com, david@redhat.com, ackerleytng@google.com, 
	aik@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 5:02=E2=80=AFAM Michael Roth <michael.roth@amd.com>=
 wrote:
>
> >
> > Increasing GMEM_GUP_NPAGES to (1UL << PUD_ORDER) is probabaly not a goo=
d idea.
> >
> > Given both TDX/SNP map at 4KB granularity, why not just invoke post_pop=
ulate()
> > per 4KB while removing the max_order from post_populate() parameters, a=
s done
> > in Sean's sketch patch [1]?
>
> That's an option too, but SNP can make use of 2MB pages in the
> post-populate callback so I don't want to shut the door on that option
> just yet if it's not too much of a pain to work in. Given the guest BIOS
> lives primarily in 1 or 2 of these 2MB regions the benefits might be
> worthwhile, and SNP doesn't have a post-post-populate promotion path
> like TDX (at least, not one that would help much for guest boot times)

Given the small initial payload size, do you really think optimizing
for setting up huge page-aligned RMP entries is worthwhile?
The code becomes somewhat complex when trying to get this scenario
working and IIUC it depends on userspace-passed initial payload
regions aligning to the huge page size. What happens if userspace
tries to trigger snp_launch_update() for two unaligned regions within
the same huge page?

What Sean suggested earlier[1] seems relatively simpler to maintain.

[1] https://lore.kernel.org/kvm/aHEwT4X0RcfZzHlt@google.com/

>
> Thanks,
>
> Mike
