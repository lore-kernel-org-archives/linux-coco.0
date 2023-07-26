Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE741AA60
	for <linux-coco@lists.linux.dev>; Wed, 26 Jul 2023 17:54:49 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-58378ae25bfso853717b3.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Jul 2023 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690394088; x=1690998888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xG7APS0bpzhflq+N7hw4kFiKO+WKlxLTJZYGvt3CQHo=;
        b=r3AoAVVwXCnsICUvyscGekoz3oFfjq5LSawP9P+x/3dZsCgHaSvF+83M857+TS1rEG
         msMIiWcmh08qrR/m5y8BaUaPileeNeV/4WZI+ptttwX0j/L0hJ9ewnfs/7EEEk8RQtRP
         0bZQ6SwNrVPA0eq6uqfF728qbXKaNRYp+O/ZbUovxA7JEeWLDRHSZn2BaYRjea/4bbdU
         3OZSU6rQ+azh0Mq9Qu/L51DJfQLBXnbMGl9HmbH0E9EHsUdrZK8Dm//Dz7sR9io08858
         DefwI3nbwgWdvs7KmCxb5ZksLySaaoxrhK5CHX9dv2YZIcrTuad2+PGbluXzKd2JCfz3
         0IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690394088; x=1690998888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xG7APS0bpzhflq+N7hw4kFiKO+WKlxLTJZYGvt3CQHo=;
        b=a1PhVbVXspePkReBs0VTrmSG+AEdnyLFccSCw1st/FWqOCEgy+AHYhVnDl8If+5DGV
         JoN0HA4FT3VC96jLywcoisXcxcM2g8NtYvolQ43yCpUiXER14c2hDRDuLcsGW+RiOiGk
         o39Ox7JTHQ7K5byF8Z66upXP546UZyR3BHtXeOO/znBmeL3OuCmaq3s4gV6pp3eHPeuc
         zaocCq7KPE2r7B8mxx8t5ggYl1v7bAjaMqb7bnd/brglcykA/YjhRETTy0aavxKH7nAH
         xIFTn+2d9+nAdX704sP7HfmsBra+z8jgATKBzD0vbGven7HNT3Q4hiXVH85LU2AOJAyz
         uknw==
X-Gm-Message-State: ABy/qLbVjlty+w2W9bvhks29Z5u15W4XmSuKUXtQevr2CQY1zfSz51mn
	LKgBPsS2OG/VCjS3dVsrewku+nS2I1U=
X-Google-Smtp-Source: APBJJlGi+bgYJFCAeVVB9sjIVs2iwu4W7+o1j0GHGwfINh+9Bc60TY6drK/2Hsi6kKa275N2EWDhJKUSd/0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ad16:0:b0:584:41a6:6cd8 with SMTP id
 l22-20020a81ad16000000b0058441a66cd8mr25083ywh.8.1690394088151; Wed, 26 Jul
 2023 10:54:48 -0700 (PDT)
Date: Wed, 26 Jul 2023 10:54:46 -0700
In-Reply-To: <a9b7df8f-77db-d8dc-efab-9ae7e9ef6922@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230726024133.GA434307@L-PF27918B-1352.> <a9b7df8f-77db-d8dc-efab-9ae7e9ef6922@amd.com>
Message-ID: <ZMFd5kkehlkIfnBA@google.com>
Subject: Re: [Question] int3_selftest() generates a #UD instead of a #BP when
 create a SEV VM
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Wu Zongyong <wuzongyong@linux.alibaba.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 26, 2023, Tom Lendacky wrote:
> On 7/25/23 21:41, Wu Zongyong wrote:
> > Hi,
> > 
> > I try to boot a SEV VM (just SEV, no SEV-ES and no SEV-SNP) with a
> > firmware written by myself.
> > 
> > But when the linux kernel executed the int3_selftest(), a #UD generated
> > instead of a #BP.
> > 
> > The stack is as follows.
> > 
> >      [    0.141804] invalid opcode: 0000 [#1] PREEMPT SMP^M
> >      [    0.141804] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.3.0+ #37^M
> >      [    0.141804] RIP: 0010:int3_selftest_ip+0x0/0x2a^M
> >      [    0.141804] Code: eb bc 66 90 0f 1f 44 00 00 48 83 ec 08 48 c7 c7 90 0d 78 83 c7 44 24 04 00 00 00 00 e8 23 fe ac fd 85 c0 75 22 48 8d 7c 24 04 <cc> 90 90 90 90 83 7c 24 04 01 75 13 48 c7 c7 90 0d 78 83 e8 42 fc^M
> >      [    0.141804] RSP: 0000:ffffffff82803f18 EFLAGS: 00010246^M
> >      [    0.141804] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000007ffffffe^M
> >      [    0.141804] RDX: ffffffff82fd4938 RSI: 0000000000000296 RDI: ffffffff82803f1c^M
> >      [    0.141804] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000fffeffff^M
> >      [    0.141804] R10: ffffffff82803e08 R11: ffffffff82f615a8 R12: 00000000ff062350^M
> >      [    0.141804] R13: 000000001fddc20a R14: 000000000090122c R15: 0000000002000000^M
> >      [    0.141804] FS:  0000000000000000(0000) GS:ffff88801f200000(0000) knlGS:0000000000000000^M
> >      [    0.141804] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033^M
> >      [    0.141804] CR2: ffff888004c00000 CR3: 000800000281f000 CR4: 00000000003506f0^M
> >      [    0.141804] Call Trace:^M
> >      [    0.141804]  <TASK>^M
> >      [    0.141804]  alternative_instructions+0xe/0x100^M
> >      [    0.141804]  check_bugs+0xa7/0x110^M
> >      [    0.141804]  start_kernel+0x320/0x430^M
> >      [    0.141804]  secondary_startup_64_no_verify+0xd3/0xdb^M
> >      [    0.141804]  </TASK>^M
> >      [    0.141804] Modules linked in:^M
> >      [    0.141804] ---[ end trace 0000000000000000 ]--
> > 
> > I'm curious how this happend. I cannot find any condition that would
> > cause the int3 instruction generate a #UD according to the AMD's spec.

One possibility is that the value from memory that gets executed diverges from the
value that is read out be the #UD handler, e.g. due to patching (doesn't seem to
be the case in this test), stale cache/tlb entries, etc.

> > BTW, it worked nomarlly with qemu and ovmf.
> 
> Does this happen every time you boot the guest with your firmware? What
> processor are you running on?

And have you ruled out KVM as the culprit?  I.e. verified that KVM is NOT injecting
a #UD.  That obviously shouldn't happen, but it should be easy to check via KVM
tracepoints.
