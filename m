Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC7C2D6614
	for <linux-coco@lists.linux.dev>; Fri, 24 Oct 2025 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761336009; cv=none; b=Iq8tiW7Qo1wZuAbj9EwkrAC5hxgl3lAYLnBr4Jb3F746USS2VysEdArcVgMTXYBsknaNbwF4p1nmUEmzfFd24/HIw23XeN/Kygnx5GBzNA9XqxGBHvRP8a5QD40DNSsUXjEneRWdlfY39guG9/AArWjADXaH4QOiQfEcq/1nXso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761336009; c=relaxed/simple;
	bh=a4koWH+uqJVKoQzJxiNmNcNNsMWDLmJfJjHP1FtuH/U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V4YJGLsv+/jwbeb9foeZz3gSYbQl5Th/9IWnxuCqO5CS7TpSgyOBOhKlhSt8AsiVDQYFO6QtuJ2dsowAlQmbNQJWVaNS3AmvPDlOaB83ywi3rXNlDDbqlzSCmijsR17lIOSKuLsEcumvIGFnYMP+pFTPY6NWqWMOLtlQsyiMhSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=shqHDr2A; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="shqHDr2A"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so2137774a91.1
        for <linux-coco@lists.linux.dev>; Fri, 24 Oct 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761336007; x=1761940807; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jQWuTAypPk4Voj8xFEEPW+odzMpA448UchXUYWZIJLM=;
        b=shqHDr2ASvrYZFafHkYuhyzWAsYQP4C89xlpBQXaGoXR0MXGMtDNWpA12PQnHnkbPy
         6dd/Ag8crDnXlIpQcvT+cjZzPiR7ROvzgQxqos+u8ih3UmV56uvwidWoYcycSvxM+MUF
         egm71nCa/dHt83bFv4l7AGzKlvOh4+7mR9G4g5lLyiTMqSGYk42OyDS3iKWNy5uNNLKN
         Pyb0bxFkQSVAWZHVWQnQWr3ONL5w++qz1NPB0OJxINeLEA/uF8TI2scmpVvrtbVUN6mK
         MmDYMvDvoUV4hgC3FUdU+rmyUP9JWFImxJgRVk3JUOiQ7qx9p7CoF8noE6EdlWN5SMJ1
         75CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761336007; x=1761940807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQWuTAypPk4Voj8xFEEPW+odzMpA448UchXUYWZIJLM=;
        b=mGMXBXz+lz3u2FCfbTQqNqU+4rf027EhXzaGlZBW20mfA+ZDwbFBj/075lluMncHeN
         ANrOLO61Un0zFKF860TGIUH3ETA/XGcZKrSgGT7NiurjA4a482WsjHNgG37KK8SDalws
         geUNYffjq6i1jFX3Tr5Al87NzcfgvCTWBQ3f5HtDcVJsKNU1mMB2swUzWVmdc8skJVl6
         mgk3CZGL1v/KCsucvwIhnABusFIY62HCkeTf59vufGjRy2wbreVJy3GSymA3lQaAXDRg
         O+8q1yDDMi3jWU8CXjsi8U4Gtas/euTKEqohkoPSRFjnyNMzfMXSvOkvYUxuXBPigus5
         O1wA==
X-Forwarded-Encrypted: i=1; AJvYcCXfKxF3Jfde+AiL8yNV3P5cpcSGmNZH0pLQERxsqj7L5e+htr3QRdRyiyD1wK8yQ718ujykRgkJjJSo@lists.linux.dev
X-Gm-Message-State: AOJu0YwzkA3e178336scupNvo+1SbmYYAKZ6e1vvgwuVLnG++L15oI+J
	Ts/eI1N9klEQkWovby2+uTTk4FItaYNbdLlz+H7fGcED64T6FYEBsJl+X/ozYke8TK/x3RhTX4t
	pSf29eQ==
X-Google-Smtp-Source: AGHT+IFtYY3qiI8xjQMQ2bKZKS2EHbuLaQsQVwT62f6KBUMnn+9sff36B3nw860TvM6kSbJYtEYl/5jnia8=
X-Received: from pjbcn18.prod.google.com ([2002:a17:90a:f092:b0:33e:287b:a4a6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c0a:b0:32d:dc3e:5575
 with SMTP id 98e67ed59e1d1-33fafb980efmr8190217a91.5.1761336005276; Fri, 24
 Oct 2025 13:00:05 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:00:03 -0700
In-Reply-To: <68fbd63450c7c_10e910021@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAGtprH96B5K9Hk5h0FgxSUBa-pik=E=dLrO-4oxx76dxb9=7wQ@mail.gmail.com>
 <IA1PR11MB9495BB77A4FAFBD78600416AE7F6A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH-h_axusSLTWsEZ6QoxgmVs0nVknqNJx-iskpsg_qHKFg@mail.gmail.com>
 <aPiEakpcADuQHqQ3@intel.com> <CAGtprH8q5U6h3p5iDYtwRiyVG_xF8hDwq6G34hLt-jhe+MRNaA@mail.gmail.com>
 <CAGtprH9bLpQQ_2UOOShd15hPwMqwW+gwo1TzczLbwGdNkcJHhg@mail.gmail.com>
 <aad8ae43-a7bd-42b2-9452-2bdee82bf0d8@intel.com> <aPsuD2fbYwCccgNi@intel.com>
 <ca688bca-df3f-4d82-97e7-20fc26f7d69e@intel.com> <68fbd63450c7c_10e910021@dwillia2-mobl4.notmuch>
Message-ID: <aPvaw6NgPBq1paUh@google.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
From: Sean Christopherson <seanjc@google.com>
To: dan.j.williams@intel.com
Cc: Dave Hansen <dave.hansen@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	Reinette Chatre <reinette.chatre@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"sagis@google.com" <sagis@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 24, 2025, dan.j.williams@intel.com wrote:
> Dave Hansen wrote:
> > On 10/24/25 00:43, Chao Gao wrote:
> > ...
> > > Beyond "the kvm_tdx object gets torn down during a build," I see two potential
> > > issues:
> > > 
> > > 1. TD Build and TDX migration aren't purely kernel processes -- they span multiple
> > >    KVM ioctls. Holding a read-write lock throughout the entire process would
> > >    require exiting to userspace while the lock is held. I think this is
> > >    irregular, but I'm not sure if it's acceptable for read-write semaphores.
> > 
> > Sure, I guess it's irregular. But look at it this way: let's say we
> > concocted some scheme to use a TD build refcount and a module update
> > flag, had them both wait_event_interruptible() on each other, and then
> > did wakeups. That would get the same semantics without an rwsem.
> 
> This sounds unworkable to me.
> 
> First, you cannot return to userspace while holding a lock. Lockdep will
> rightfully scream:
> 
>     "WARNING: lock held when returning to user space!"
> 
> The complexity of ensuring that a multi-stage ABI transaction completes
> from the kernel side is painful. If that process dies in the middle of
> its ABI sequence who cleans up these references?
> 
> The operational mechanism to make sure that one process flow does not
> mess up another process flow is for those process to communicate with
> *userspace* file locks, or for those process to check for failures after
> the fact and retry. Unless you can make the build side an atomic ABI,
> this is a documentation + userspace problem, not a kernel problem.

C'mon people (especially the Google folks), this is the ***exact*** same problem
as certificate updates for SNP[1].  Y'all suggested holding a lock across a userspace
exit back then, and Dan's analysis confirms my reaction from back then that
"Holding a lock across an exit to userspace seems wildly unsafe."[2]

In the end, it took more time to understand the problem then to sketch out and
test a solution[3]. 

Unless this somehow puts the host (kernel) at risk, this is a userspace problem.

[1] https://lore.kernel.org/all/20240426173515.6pio42iqvjj2aeac@amd.com
[2] https://lore.kernel.org/all/Zx_V5SHwzDAl8ZQR@google.com
[3] https://lore.kernel.org/all/ZixCYlKn5OYUFWEq@google.com
