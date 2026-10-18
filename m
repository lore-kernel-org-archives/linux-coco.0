Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E313DBD53
	for <linux-coco@lists.linux.dev>; Sun, 18 Oct 2026 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792367621; cv=pass; b=QmC/Zzc3E8KKihYpxq7jnp8Cp/fjUll6Mu73XUZVUafS1SDZQdWpv7cirHcF5r0OlgI+5rfts7D0frvCdG3Bs9NIKwRJsn2/F4h3N/uzG+O2mhbVP0Eusw1E7ObnF5+PkNcDDH/Vd65V6NwsD7jA/eM7jZaH8JG74vyyst3Iejo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792367621; c=relaxed/simple;
	bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pful3PwyDJZ67DSsFUNXjDR3auRM52vkqHc58eQe3UdypUYksg3c7Z2t+kbUWj/ZZ23A709GvMYkbNDzz2Dd3EDTOVCxG80pRIyQ11sreuoF2fkUvugl3wm4IqVQ3fd8BQezLMdsnmXKtSXkqTbthU2NSNokSAe7eShQmhNsl/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7aznOo4; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7aznOo4"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so881284b3a.0
        for <linux-coco@lists.linux.dev>; Sun, 18 Oct 2026 16:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792367620; cv=none;
        d=google.com; s=arc-20260327;
        b=oGl2/T8ozaiAh4auPw5sjpviM8ADd2r/9g+9oiW6wfJ71zBDMsR7B5pB3xMtwjYMwp
         rydbJNvm0uloM8lsAFKjEtDwraVCejXZ0p3QihyBuN+hwdH7uTDWz0HJZZmPSlM+vQi5
         HF9C98PcUmHzxLW1pJ57tTF+V9SRjPEVCKoYusvf+aXGMRiA9CCdluQFj5q3PjhPP65V
         WOALlcdHKP79a60HRAhhkLnSQ5eBSjsWBCevrwQuy6vM6+Sk97nFgkTSlviulkqEyiLk
         gj7PBxn/DsNz6KPrIwf5WzNdWYLk/H86kSewqUpoYA1WnhrvW6zBhcfYQ4S/ya83bQHL
         w+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
        fh=6ZaRctuBsKdWlqkZZd/0KOjVx8PzGH6xud9qnrX6ZMc=;
        b=bg/D2ZtvMIZ7PxXPvmV0eTGZFuJt2+hDgQ6SvuFUDBLAnOlbSe66LXGDQtfQZaWRky
         JDSl6ZqhwDB4vWsLSr00dwJWmjb+J/GHOMABbppVhAMYM3RUfzpvsIO17LxV2xniZZvj
         tof+94SDdeeGDm9GGco4Z3bH6GqFDpC0vtN7XlYdWLHO4mCLBVUHmIAEGfzIfUe7NiBJ
         NcZS60uyv7Rh2WW4Aq43cfGEgg/rs1+3Zj3uJWCzJvqxGMOx1E+mgZWYn7DMoLWXuYOQ
         2e6vcmlVj4ATiz2lV3g7UZ/mn7GcrSVuX00Owv4gyXmCVNGFETutymwkbiRryXIf271M
         Mcew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792367620; x=1792972420; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
        b=U7aznOo4aa1wNu1sBjYxlRLHvDMQNlbwNGRKOZMpyjR6D89ob2DDGQsgs2nrG7avxx
         mpa1Q1R6ojzwO8eL+kZ2hWZ8JqQ50Wt0X492uOW3UhQNePrGn1JXDVm+biXLOHvMy75o
         lI58JxR/PtLvgInnEuqb1Bg/wu2dpf6O1+OxlULE/ISQuiqVactPj5DjoK5Lmc+sB3wl
         WPfl8W5nf+AnKfg09BHyx4Jml38bXosltgnXTRnuuuS5MYMmGjxS7g23dSsSHBpz9TRp
         gtoPZEzgWs56KQGMHY0fo0mMAcxP+DOfi0cHPT7QIpCOBAdssXDHsxnBYdGH93mKMNjj
         tyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792367620; x=1792972420;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ikcStFONhfs5hokFZ9u0J5DwZzPFduPyuFeHVqSmKog=;
        b=mwnmiTAurzouu+RNffwjqJMf5BWZ3ExczvuKtCucYASHwECjalj3PlzN3F3qnK5Dh1
         IDieP2TJp4zSlI5fChTZaL79iK8mdi7R1sjll55uT7egfS9rfR3TM0RHBpZnr/8U1lqe
         gytR8eeIjit9coi5AWZvU452p6r2u6PFHKIouRgiCu35p9+czF70xMFgMVSFDzQcmoTg
         hdxUc0WnBKw7MEU7iCucXZ7j90lj7CLwTa01Xt2ux0nNz0KAuvzScw6p9RPMyMK9i6Fz
         oFatlxB4juoX19fTiqiJz29TgwyfLESbtK/gr9WRXFnDIxOs48+uBWxRhhb1KqnSIZ1V
         D6Pw==
X-Forwarded-Encrypted: i=1; AKwUvBw2HbQb6VGs6nzjjmiMX3mykqTO+qMifZCsoSKG6crYBzNJP6xZJhCikmiYL+4H2EaEPo4kTZ1h3R+O@lists.linux.dev
X-Gm-Message-State: AFq9FYKLOw1/0K+JOFElsFi84z7tm/b4uH4YR4AwLgLc6nbfs+EWyNa3
	+gaCE9r1skTXaoMnvcvpHXJQ6Zv7mHbp8cB6YGSFHJzcOyB6zpx/EEaA22bHXUxaNbYgqHVru7e
	rnoNnogkXhUzYR6p/uc+qFoapRo9m9Og=
X-Gm-Gg: AYBFou3V9BWmK/PS3y3fC5evGDf3QWAW9QXnVyyCgooBEoHNkaJMUl2bDLcmfWipNRI
	thYCnUqFnq4taS9UudL2P0+vA76zTlMrp/jR7h7EqWkLhUwESn5T9BLn4V7xDnaShGDdpCM6LUV
	MXMdjJJeZL7r6P82QU1PzRRjmP31D5ley3KR2r+e6TEGcOTBnHjTKrkI85IW2ReaU0G8sBGJzyH
	zqUfgpRKwEiGjW8Cyu7rV+js39QfNjdGWdOaZ8TrNPckiffUKRdrtkxm8P/i86T3c2dXFMuunaU
	L3x0IGW7JU9Q1mclr+4Yyv4ngvZbaibKoCdLbooAIWqxg3moiBgRfV8mNcjOwt6lAtp4WId48YO
	ib8mkRhXglC5XFFGPhg==
X-Received: by 2002:a05:6a00:1806:b0:892:597f:37d8 with SMTP id
 d2e1a72fcca58-8a04ba18454mr4779902b3a.15.1792367619719; Sun, 18 Oct 2026
 16:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015145053.3664509-1-jiri@resnulli.us> <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com> <atPgqROZZxnihYfC@kernel.org> <20261017231007.GP13920@nvidia.com>
In-Reply-To: <20261017231007.GP13920@nvidia.com>
From: Dionna Glaze <drdeeglaze@gmail.com>
Date: Sun, 18 Oct 2026 16:53:28 -0700
X-Gm-Features: AclHuK9GuI1sFp98b1K0khmGUju9GL5ycOOU8Mt4euoyLz8UHj6wifrtGgAMHK0
Message-ID: <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX support
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, david.quigley@intel.com, 
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Content-Type: text/plain; charset="UTF-8"

> On Sat, Oct 17, 2026 at 11:55:05PM +0300, Jarkko Sakkinen wrote:
> > I wish I had a better picture what is going on.

Me too. I've spent my Sunday with Claude trying to build some
understanding of all this stuff, and put together a static site about
this series.

https://deeglaze.github.io/scratch/ctlv-site/index.html

It includes a review that I've personally walked through to ensure it
wasn't off base, but of course we're all fallible here.
I haven't decided to email the review comments to the list yet because
it's pretty thorough for something posted here as an RFC.

I think something to be really careful about with this series is how
it's managing kernel memory.

* https://deeglaze.github.io/scratch/ctlv-site/review-02.html#reply-7
* https://deeglaze.github.io/scratch/ctlv-site/review-04.html#reply-27
* https://deeglaze.github.io/scratch/ctlv-site/review-07.html#reply-7
* https://deeglaze.github.io/scratch/ctlv-site/review-11.html#reply-8
* https://deeglaze.github.io/scratch/ctlv-site/review-16.html#reply-30
* https://deeglaze.github.io/scratch/ctlv-site/review-18.html#reply-19

Something I and some others dislike about IMA is the unbounded log. I
don't know how many stalled proposals there have been so far to permit
some model of "snapshot/endorse and truncate" to allow a remote
attestation verification service to store existing logs in object
storage, measure the reference and/or trusted signature that the log
was "good", and then drop everything in the log prior to the
pointer/endorsement event, but we have a chance to start with the
right model here. I liked Tushar's talk in 2024
https://www.youtube.com/watch?v=5cXDrIx8Qgo
IMA carries its log through kexec and this log doesn't, which is a
hazard to later attestations that don't have some other out of band
protocol to associate its boot instance with some off-box cache of the
rest of the log.

>
> Currently we don't have an intention to flow TPM command packets
> through this. Anything would be a high level operation like 'extend'
>

If you're not intercepting all extends through other interfaces to the
registers (e.g., /dev/tpmrm0), then it needs to be clearer in the
documentation that users not using the interface will break users of
the interface when they both target overlapping sets of registers.
