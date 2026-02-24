Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A003E3783A0
	for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771957767; cv=pass; b=AuHoxU7asAuQWzv3wPMRDyW8gi8myN/qM/zfCla9XJ2pMgr+SiomAxaARdrYih+b6iaiLoWziiKNlRl579ANWMUFjsuGAysyrkorbUEy/NkhFnSnIKVmWG6Aqw3wTpIb2emXsPK7YEv+95IG5nav0Ux7fF0TMsnIH79+50VWQkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771957767; c=relaxed/simple;
	bh=4tFKqKq7LxHiApRhoTkOfQequmtDldphLqXpvVMEAek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLr0EBmr7ojoZJOJeOU4SoLKcBDrKVSciWVxf3a2qmtSt5pIeib9UYU9XuzYzvDc23hdh918HjfGIIIaeSFDvfEgsJpUcZs9ZbFhBuodsveBq8bEiOIGv1zpVLphnV5aA5vKTGPB2YYeWqnpSWovHkoWMJ5AK3rAA8YYpVp2jZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HtXNrsK5; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HtXNrsK5"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65a38c42037so811a12.0
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 10:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771957764; cv=none;
        d=google.com; s=arc-20240605;
        b=Ik438DoYLbL/Sv4Ksj/xz0Qa4ak1N9iQ3QjnSemIoMsmQG/LOUYELMvi9JU536rPvF
         vnOf0trQaVtoohwbLMHMFwzKcG/H2O7gxrPWnIaUEcTf0P1uYhsc1rARJ3TW9q34mPSK
         r0lNByX6h/WEuBj81VcM1kLLOksg7Pq0YFmOzVhKr0QxwnJ3XbDOHshykpYOSU/VT84m
         RCi3eOLjz3FzefScPuHEDBZUS7nb6voHb9G8KuEy8vcfdVePxDkynctrsQTwBPMeZ6V/
         tOgFWBtFM3bjoAiAuL5qNwC98j5NUc5cTlAy/kXwMyfjQRiJhw8RxG0LtLwzVOQvvj/v
         7SMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=runWMJn0J9oOBYzJ6m4yNE1KKJE9xc/latz4EBzuSpE=;
        fh=2oJZTQU93T302LfUamI2+jIbU5Jmyh9GdmQebSl7H2o=;
        b=OCJz+T9YqpU2zfYJzSXiHpocaeEA+ELb9cNbO5EXJkZbGCllzvtUA//mzZT41xBHzK
         MQPsKociWRi8UQ28BLgoBeNPTeHV4YsR2gtzkajjHiWme33G0u3G/vl02CHQHvfkD1zs
         lJ6e92AS0U260vLIiUR5kVxzx3ksEe3/vZfbG94lCDxxCInQFq8JRSJ8vCFhMIyVchf0
         OoQWdEHahyIA0L3a5kUCc9sC3jKMgzZI3Kg/Iw4WXnei0fsr9GSVz547BLRmFgQfWcTl
         1dmjGwVN1cwLOPTfKLxF21sL/9KnesfzBQXJ8pDJv41npDXrY78nzzEAjy+PzrEApViE
         vO9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771957764; x=1772562564; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=runWMJn0J9oOBYzJ6m4yNE1KKJE9xc/latz4EBzuSpE=;
        b=HtXNrsK5kXf9qRM/m066cWh4FieQdMMsWVHLGJESYkeqDIf4VM0PQnkKW3BzG2cVij
         nnaZ77VmYqoEfZcRLJFORsomEQbsL8k4w3IHmDngebEyj24cDl0P4BkBMIM+q+qnR8QK
         LZOPjoVJ3FiOuxBtt8/javQ67ewF7L7g4HNk7U5B9YJ/yDpOpFos80djX6+LKtRPbuzY
         CuSvIRP6QZ11YDltB+hD0qS23vVdhYYHST/AuDV6O3+sHjsR/MU61m+ZcUn0OARXL7A1
         N/yj/S/7GfxThwvyH/fHdBw8NJuirg8/9xIEAnBEA4Z/yfKbq6CW5AgZj+hpYIhJshcD
         B+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771957764; x=1772562564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=runWMJn0J9oOBYzJ6m4yNE1KKJE9xc/latz4EBzuSpE=;
        b=rBLgO2vwzVv9S8epR7sbFFOMf0M8K5kHHI7syhiyFOPcKn488tSYHaudimdM+uqyWH
         PZU1J7Qei/5e6DsmlaauDQOucHBmftlPhvKRQJ7gX/tNxBcmP+XsV6PmIeIkGL7cF8JC
         wYMp/6XmVVGR8hQVNUSuUKealNY0g1ZAm6gzwU8vMbZf5NpfXtKkhwXe2bMn+EOOXLcj
         44g+jL1WxKWS6USwTaqFrhZT4RdYRKWgy/6e3UiqpEmRoyibvXBHatGGvukRJ9kwIkLk
         6nf3retE0sYXSbAUEo9OzkZvV6ghoj8i4D7F4dQJJ3J0ZCjAAwsZkpUq4YXgoUx6q2cJ
         6D7A==
X-Forwarded-Encrypted: i=1; AJvYcCWaX9VxpNil/Vwhm9gnavtRVkgRQtvr/VXETFpHAN3Ve6AwKNZimfHhot7IrG5RNwl/K/eUhrKSfTJc@lists.linux.dev
X-Gm-Message-State: AOJu0YxBC55fsuo+z9rUveeD/tqY5tmetByF3A/dB6yR/4do+BRKtbKh
	Iw0Ql+vO10uZ54YmYBy6tRrCHr98YELI0wFAqcP5buofCBYonWdhzd6swCyHBYxu5Z1TwQ14OwB
	9UegStlfR7wDwjmiQizd/mt8jZR9WKb48wNNTMNR+
X-Gm-Gg: ATEYQzxX8bSxvxLJWxuOL7jtGzrq8EYyU1P1zSJHc/NNZMizp8bOpHpzfgedX5jXd/p
	CaH+/iFCibomfTw/1ucalEaiqQVEva/9lyc0TzsZs8pJt3oh7Ep9TLb39n9Xj83TWYhAg/p7XOV
	bnwHq0m+oz5YZGaUSk/c912SI6farDK5HDhWixPrKCMIAJzP4na0bS0Aba2cdlDVjup8I6kHEKe
	TueowEk3aS57qnwCEEWoIDgpby4lNVfZpfJxlP3LQSWj5OPOgiKwE4ifHeWmmPC8B8ZqOrPtubH
	2joXjP4=
X-Received: by 2002:aa7:d8c9:0:b0:65f:76c8:b92f with SMTP id
 4fb4d7f45d1cf-65f823a9090mr3867a12.0.1771957763587; Tue, 24 Feb 2026 10:29:23
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224180157.725159-1-kim.phillips@amd.com> <20260224180157.725159-2-kim.phillips@amd.com>
 <6b3b0c86-99eb-406d-b88d-3d71613bef9e@intel.com>
In-Reply-To: <6b3b0c86-99eb-406d-b88d-3d71613bef9e@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 24 Feb 2026 10:29:11 -0800
X-Gm-Features: AaiRm52tDwFSIncbciiIXzMFhAD28L3SFP_lpf0FhC49DMlc8OhD_P85p32kjvM
Message-ID: <CALMp9eQzaWJvnTtJzcyvTuYFT3JSgo+4Tu2w4a7mPoEah4P5jw@mail.gmail.com>
Subject: Re: [PATCH 1/3] cpu/bugs: Fix selecting Automatic IBRS using spectre_v2=eibrs
To: Dave Hansen <dave.hansen@intel.com>
Cc: Kim Phillips <kim.phillips@amd.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Borislav Petkov <borislav.petkov@amd.com>, Borislav Petkov <bp@alien8.de>, Naveen Rao <naveen.rao@amd.com>, 
	David Kaplan <david.kaplan@amd.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 10:23=E2=80=AFAM Dave Hansen <dave.hansen@intel.com=
> wrote:
>
> On 2/24/26 10:01, Kim Phillips wrote:
> > @@ -2136,7 +2136,8 @@ static void __init spectre_v2_select_mitigation(v=
oid)
> >       if ((spectre_v2_cmd =3D=3D SPECTRE_V2_CMD_EIBRS ||
> >            spectre_v2_cmd =3D=3D SPECTRE_V2_CMD_EIBRS_LFENCE ||
> >            spectre_v2_cmd =3D=3D SPECTRE_V2_CMD_EIBRS_RETPOLINE) &&
> > -         !boot_cpu_has(X86_FEATURE_IBRS_ENHANCED)) {
> > +         !(boot_cpu_has(X86_FEATURE_IBRS_ENHANCED) ||
> > +           boot_cpu_has(X86_FEATURE_AUTOIBRS))) {
> >               pr_err("EIBRS selected but CPU doesn't have Enhanced or A=
utomatic IBRS. Switching to AUTO select\n");
> >               spectre_v2_cmd =3D SPECTRE_V2_CMD_AUTO;
> >       }
>
> Didn't we agree to just use the "Intel feature" name?

Aren't they quite different? IIRC, IBRS_ENHANCED protects host
userspace from guest indirect branch steering (i.e. VMSCAPE style
attacks), but AUTOIBRS does not.
