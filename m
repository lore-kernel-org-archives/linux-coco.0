Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B812C18EAB
	for <linux-coco@lists.linux.dev>; Mon,  3 Feb 2025 22:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620204; cv=none; b=XBQDbyxRmyV+t4e1WTWqHPO6OhnICi8YChhPUmjLIdgGZ+atZTM2g+JPfJXvxACc+3ZTT/c/Re7igQGqDPtaPsOV+cawiIsgb4fI3DebhPZ1FhYJB6qItVQIrcbOxzi8cVf9TLVkks+MkdHWjux2b8fbzqxhP8JbqUzu6oY/YwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620204; c=relaxed/simple;
	bh=eUs8Te/3qXoZlaU+lsAvePAAnsKpOkJeJh7kJfdkLCY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SZXZtzS6vUS8r8J4m4z7Q4sLqtiPzKtz1qlDjQ3dUSqRXRqBgFO24vf1F6pIDksJ44bipE/GnAK/I5mACHlEHWArK6nvyLvoy9EP+mHpaKqP95ZWVHM2rZDSwN2vLYDk4/WMOC0yWHAkxAtgwbAQ5O2+iMEQv07AlG7qGRDjDv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cn4ipmJl; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cn4ipmJl"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2165433e229so108447285ad.1
        for <linux-coco@lists.linux.dev>; Mon, 03 Feb 2025 14:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738620201; x=1739225001; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aKyU5o4qg4MzJLbHNBTuIVedrQGzcqdvvxUHOUnfSU8=;
        b=cn4ipmJlWfwXkwk/w6QcY9qi1GKqHMKyRThiDv21MbsCGQCQiseZwWvb+L0C3muYey
         r6J/FrtcG6hpUISZRaXE//3odYZ51iPxVv5/espc58x0KVaMF/xD54OeDNVJ2pqYaqZK
         CcC2fF/yEl3TB4+sey3xp1mLXWiRL7vJUY6UZBIdetKVmeEFhx2pmqWpTphCHi7pzsi/
         gHf6g54iRkfSEdxwvETBuVBfAO1/QCv2QaoL+BZkMVVCW+XgbQ3c6V47Vz9Q7hR6Rk8U
         rkrlt/ItpraCCUI5CfPCD7E5ZcdqoqlXjLB+oYAJXQxiFoOs/8Gn1oof0Aa/RJK9kaWF
         tlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738620201; x=1739225001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKyU5o4qg4MzJLbHNBTuIVedrQGzcqdvvxUHOUnfSU8=;
        b=XJNvsf3yaNm8+KrrLLIC6SEA6YMKyA4fm85YI1BjEhFq7PExry656JEJvWugtNRu0Q
         hBmijfRZxpqOgLkWFjg+fHnWJ8u/F+8brKciByKrEVGZQXwfJ4TBzfeJO8WRCB+jbl/F
         i7B0aFlaz5vMyS+atLDWYERLngaMUYl5m39szxdd5JFwx5Lhcgy5sGPFb33Uj8gIGrG+
         noWEPkDJgp8CjE3RLWddn1GIgSq/C8Zovt/dcANicuz9oFdaYRjKGfLWlhKAWPOZJy/y
         ke78xrAvWU/Oa3hiVgJzGm+KlR/553w6mYQbUpqJYfCbB7Wo2fBrYVq5gA0yqMZTxHjW
         lxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnr00xA+iIgf9ljIBmT9sDY99iYSXVKFG/o2+WjkOo4hxYKaR8E/oS9p/IXOACyBJkSDbHxOrdvXUB@lists.linux.dev
X-Gm-Message-State: AOJu0YznRE/QlHkV+XwvgxjCmoQrHVOwlAGewnLm1BP9zffzEyqTsc4O
	wDqr1R8SdbA1wZEChD0NxVfG/zp2C8f2C7teOn4+VZejrW9U7k5pCdNki39AqToU7gotMRSBAOL
	b5A==
X-Google-Smtp-Source: AGHT+IFdBp/YFKt3tvbP89npJlfJHjx2Z4+9Qkgevwe01Rjz28QPVaPLsqR/RKs2uDbYm8l82lXHNvJ4gI0=
X-Received: from pfbfb39.prod.google.com ([2002:a05:6a00:2da7:b0:728:e945:d2c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:acc:b0:71d:f2e3:a878
 with SMTP id d2e1a72fcca58-72fd0bc6c50mr33717772b3a.5.1738620200924; Mon, 03
 Feb 2025 14:03:20 -0800 (PST)
Date: Mon, 3 Feb 2025 14:03:19 -0800
In-Reply-To: <855xlra7yh.fsf@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-2-seanjc@google.com>
 <855xlra7yh.fsf@amd.com>
Message-ID: <Z6E9JyybI6SUWlcG@google.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Nikunj A Dadhania <nikunj@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 03, 2025, Nikunj A Dadhania wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > Extract retrieval of TSC frequency information from CPUID into standalone
> > helpers so that TDX guest support and kvmlock can reuse the logic.  Provide
> 
> s/kvmlock/kvmclock
> 
> > a version that includes the multiplier math as TDX in particular does NOT
> > want to use native_calibrate_tsc()'s fallback logic that derives the TSC
> > frequency based on CPUID.0x16 when the core crystal frequency isn't known.
> >
> > No functional change intended.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> 
> ...
> 
> > +
> > +static inline int cpuid_get_tsc_freq(unsigned int *tsc_khz,
> > +				     unsigned int *crystal_khz)
> 
> Should we add this in patch 6/16 where it is being used for the first time ?

No strong preference on my end.  I put it here mostly to keep each patch focused
on a single subsystem where possible, since the series touches so many areas.  I
also wanted to show the "full" API in a single patch, but I agree that adding a
helper without a user is generally undesirable.
