Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB20239E80
	for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364282; cv=none; b=s7vDVsbjZG8TzUG4cyzS4lpFWVLk4xIwP+ln0CEtECNthY6sNOQHVVlhBYwXk5I4+7IDKppvtuZaVZzjo0C7xBoS4+V/EQfVaysdEWcUkQxaSGVT2Rpghaad8ll+eybARS+9e+iGqd7iC8QwPIyzCp4uyQJU2EpcV03M+9Of2zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364282; c=relaxed/simple;
	bh=k7Wnh0MDFRkiNum8Z2X+Q1EMJvXMBuyi/5gO1W0mwIk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ie4XqhjB/2xKP/mtX/TXvt9aPJH0D6hrM4hYGz6JanxSk/OtUodKNyORO3kla/YqCT9JAwIaMxkHCu+ThHIGo7XhKsODgUZD2QmSsrEGurKjJeKOWtp7IrIKNWKvjQ8A0igL3NtwFHGblm01EZGk7pti/t8U56tiRsWS7VKqTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tu3UG9wD; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tu3UG9wD"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-27ee214108cso172897995ad.0
        for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760364278; x=1760969078; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TXpOOr+C08LiSxfY7wTnlbBjPJg18+PGY+BCgjJ/7/c=;
        b=tu3UG9wDzVCbeyb1bs0bPwBJm0WE0SdBue+SJKm4jcrqu5/wny+bb0do10Dt57+et2
         DGb1kE6rtvCHAAx2zGVJkJypEg/z17OIEHgHsPa2FVQIZQpNSG/RSl+jhbL8ZAI8zDGO
         pM9pfPGA5iKc4+MJ8uxJGkWWjWWZTyWsWLfXq/SjcNSS1Z6LhKgdOh/twY78NKLwNSke
         QbpsEt/cKH3751R68gz+wItbodF2i6xnCcmLPNCYicmVpDlh4FBa04IlmFZKcDnVvnu3
         08EqzkrgcrLL9fiSB+9ENwdcTZCkCkXG/i/lN5LPcL81saE7+ThK+p/Q9RcSYMWiPZaW
         JCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364278; x=1760969078;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXpOOr+C08LiSxfY7wTnlbBjPJg18+PGY+BCgjJ/7/c=;
        b=s6FPtqQBZzR1vW4FyObIExT/0kiPjOGP28RJlM6Tej9vPtKWDaPsGK4+5mvTQ7BUMX
         3wBYbINnZMhmy5dS4Mcg7gTAs9CH3jQN59gQ0fDKxKo/1ophYsxwkGAmhBfqJ3EjdlnM
         GDQiUAe5YiA7BgfuLp53MDTpvvA3o8InOaXghoJE+KJnuZFMg/34EwevOO1Awt4eSM4I
         UjLa6V6AelUW6beUbkGoFMEy8mim6eggRM/HNLFSRskOCdvDumvGehxGHORlCoB2/NRZ
         c5zJwz7N7Qq08tzymR1/n9cvJXJY7tSAuFVpi1j4uYWoEXYcvxTlPpCOB15lFrot39Wv
         kJew==
X-Forwarded-Encrypted: i=1; AJvYcCXruHcivbdG3gWLiY3NxNU+EKY7XB8TsIuJqJQNFpVIibME4vSKhC0dc87fbX72FTT8zun2R6irYF8E@lists.linux.dev
X-Gm-Message-State: AOJu0YxXWgaImfDjfeNR9IEuVdri4wJYIzJGrHE7/fnfJtrEtrrdRD7D
	GZ0GDD9YfOsxxLf1iJFgNesMu178/uHSaMa4no5XN+tK6JsnVVSxf06mPD6kWyuEbNLXvFZt4DK
	gZxpRFw==
X-Google-Smtp-Source: AGHT+IHwYmKV6bklpg5vtbSKVTRl7C6XEgSh9a6Y5HHFfYZD2Yg6qM+/GQ0Os6vJiLGLtryEtk6AaBRhVnQ=
X-Received: from pjbst8.prod.google.com ([2002:a17:90b:1fc8:b0:330:523b:2b23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:910:b0:258:9d26:1860
 with SMTP id d9443c01a7336-290273ffeb7mr293116575ad.40.1760364278498; Mon, 13
 Oct 2025 07:04:38 -0700 (PDT)
Date: Mon, 13 Oct 2025 07:04:37 -0700
In-Reply-To: <20251012071607.17646-1-shivankg@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251012071607.17646-1-shivankg@amd.com>
Message-ID: <aO0G9Ycu_SlISBih@google.com>
Subject: Re: [PATCH V3 kvm-x86/gmem 1/2] KVM: guest_memfd: move
 kvm_gmem_get_index() and use in kvm_gmem_prepare_folio()
From: Sean Christopherson <seanjc@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: pbonzini@redhat.com, david@redhat.com, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

FWIW, there's no need to put the base (target?) branch in the subject.  The
branch name is often incomplete information; by the time someone goes to apply
the patch, the branch may have changed significantly, or maybe have even been
deleted, e.g. I use ephemeral topic branch for kvm-x86 that get deleted once
their content is merge to kvm/next.

From Documentation/process/maintainer-kvm-x86.rst, my strong preference is that
contributors always use kvm-x86/next as the base branch,

  Base Tree/Branch
  ~~~~~~~~~~~~~~~~
  Fixes that target the current release, a.k.a. mainline, should be based on
  ``git://git.kernel.org/pub/scm/virt/kvm/kvm.git master``.  Note, fixes do not
  automatically warrant inclusion in the current release.  There is no singular
  rule, but typically only fixes for bugs that are urgent, critical, and/or were
  introduced in the current release should target the current release.
  
  Everything else should be based on ``kvm-x86/next``, i.e. there is no need to
  select a specific topic branch as the base.  If there are conflicts and/or
  dependencies across topic branches, it is the maintainer's job to sort them
  out.
  
  The only exception to using ``kvm-x86/next`` as the base is if a patch/series
  is a multi-arch series, i.e. has non-trivial modifications to common KVM code
  and/or has more than superficial changes to other architectures' code.  Multi-
  arch patch/series should instead be based on a common, stable point in KVM's
  history, e.g. the release candidate upon which ``kvm-x86 next`` is based.  If
  you're unsure whether a patch/series is truly multi-arch, err on the side of
  caution and treat it as multi-arch, i.e. use a common base.

and then use the --base option with git format-patch to capture the exact hash.

  Git Base
  ~~~~~~~~
  If you are using git version 2.9.0 or later (Googlers, this is all of you!),
  use ``git format-patch`` with the ``--base`` flag to automatically include the
  base tree information in the generated patches.
  
  Note, ``--base=auto`` works as expected if and only if a branch's upstream is
  set to the base topic branch, e.g. it will do the wrong thing if your upstream
  is set to your personal repository for backup purposes.  An alternative "auto"
  solution is to derive the names of your development branches based on their
  KVM x86 topic, and feed that into ``--base``.  E.g. ``x86/pmu/my_branch_name``,
  and then write a small wrapper to extract ``pmu`` from the current branch name
  to yield ``--base=x/pmu``, where ``x`` is whatever name your repository uses to
  track the KVM x86 remote.

My pushes to kvm-x86/next are always --force pushes (it's rebuilt like linux-next,
though far less frequently), but when pushing, I also push a persistent tag so
that the exact object for each incarnation of kvm-x86/next is reachable.  Combined
with --base, that makes it easy to apply a patch/series even months/years after
the fact (assuming I didn't screw up or forget the tag).
