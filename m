Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81CC18B0A
	for <linux-coco@lists.linux.dev>; Mon, 31 Jul 2023 14:30:02 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-55be4f03661so4786136a12.1
        for <linux-coco@lists.linux.dev>; Mon, 31 Jul 2023 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690813802; x=1691418602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ObUdgROJ4Fh6eGJrzpfR0YhkAzW7v0vw5c8AAWfwu6Y=;
        b=Tk9LoTMTTsEQqNvFWItA11F7gfp/gOQ/YnVlWInA1K44dlehN3cr8tbgER2TDsioQD
         M8EKZjZr+uxZAvdq1pAthJlrk/hQVImPC0csEHGHRru6EtYPWYFaQ1dK9ZYypfOlkYZM
         7OIjHkZVMJra3SF3JYr8YPdSWXFrA8YESyjxZmccUc+UwE9tzenDvdDMhSQdogJ02/9V
         CODm8eN5WRLPtikUqG1VqppGe4N7ikOXJ7q/qqEsdshtoH2o29FkfUssxpWVO2u68lNC
         MRbdwHNMeLCe6r6iXAovuJbi9j/lZYb8wTzl0/MUSRwZ40jvN1IAyn8Za88mB4OVqXi4
         rKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690813802; x=1691418602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObUdgROJ4Fh6eGJrzpfR0YhkAzW7v0vw5c8AAWfwu6Y=;
        b=lpW3bab9Y7EJGkJjC3j9S0/Iux9qzt4invScrtQU8nFyECZGFdzybqO7X0xcrV4TFI
         495XW0cxtwOUC0C5JbuNn2RYakIptiIFhLbwqUTnIJeH53fyTPi/ctLa9r/Xr7k+GCvA
         XwHO6OfdR/TSVpl94yOvBcmq849EedpiRDaoSco0YFSHdCHDRhFGHhw4FOXc4iWbhJrI
         lRbKbethBQM3vyrUA/t0lMHvBQ2lkBGM7b94DksoUIn5KrpfIRqJdm1VD2rEgStY37qx
         /p1cTR0mXNcm2Uskltz3ad/5zjRWJVlBpztdlDtym8XhDo9Lxpt/p7+6ezWdgBTpGCWy
         MTrA==
X-Gm-Message-State: ABy/qLaG9beBSwPwUZq8340n7jKOJqIgvoo1i50+q4E58ACvp2qTyyVI
	uJsC5rL2Oo74GG5FHA4QuyUvIJXWsgc=
X-Google-Smtp-Source: APBJJlFJCgvQUS3lYgpzxhrJr8+EP6qWlgqSSdZQQWXDlb76ZJKxLdFvbGJeFc6OC4VTdbe4FKDPaZCJ5V8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce84:b0:1b8:2cee:946b with SMTP id
 f4-20020a170902ce8400b001b82cee946bmr43357plg.11.1690813802190; Mon, 31 Jul
 2023 07:30:02 -0700 (PDT)
Date: Mon, 31 Jul 2023 07:30:00 -0700
In-Reply-To: <8eb933fd-2cf3-d7a9-32fe-2a1d82eac42a@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <8eb933fd-2cf3-d7a9-32fe-2a1d82eac42a@mail.ustc.edu.cn>
Message-ID: <ZMfFaF2M6Vrh/QdW@google.com>
Subject: Re: [Question] int3 instruction generates a #UD in SEV VM
From: Sean Christopherson <seanjc@google.com>
To: wuzongyong <wuzongyo@mail.ustc.edu.cn>
Cc: linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Sat, Jul 29, 2023, wuzongyong wrote:
> Hi,
> I am writing a firmware in Rust to support SEV based on project td-shim[1].
> But when I create a SEV VM (just SEV, no SEV-ES and no SEV-SNP) with the firmware,
> the linux kernel crashed because the int3 instruction in int3_selftest() cause a
> #UD.

...

> BTW, if a create a normal VM without SEV by qemu & OVMF, the int3 instruction always generates a
> #BP.
> So I am confused now about the behaviour of int3 instruction, could anyone help to explain the behaviour?
> Any suggestion is appreciated!

Have you tried my suggestions from the other thread[*]?

  : > > I'm curious how this happend. I cannot find any condition that would
  : > > cause the int3 instruction generate a #UD according to the AMD's spec.
  : 
  : One possibility is that the value from memory that gets executed diverges from the
  : value that is read out be the #UD handler, e.g. due to patching (doesn't seem to
  : be the case in this test), stale cache/tlb entries, etc.
  : 
  : > > BTW, it worked nomarlly with qemu and ovmf.
  : > 
  : > Does this happen every time you boot the guest with your firmware? What
  : > processor are you running on?
  : 
  : And have you ruled out KVM as the culprit?  I.e. verified that KVM is NOT injecting
  : a #UD.  That obviously shouldn't happen, but it should be easy to check via KVM
  : tracepoints.

[*] https://lore.kernel.org/all/ZMFd5kkehlkIfnBA@google.com
