Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7713101A9
	for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 04:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786940362; cv=pass; b=nExduJDzjNum/y4kesAp7wtZXg/lXWLVcnB0+8neJ31xpq+BdzCCHZgCv6aBdIEnjAwGzJUlAQdWaPb18YwE5ew6/o8zLOyX07NOHVJzI0VWr7qtVn8Ia73hMeVnbP3/BYBR+WNybtx2kox09GnMoGS1AgnHaSmgwpRsi7cxmcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786940362; c=relaxed/simple;
	bh=lpIs2XFFMgCO2eDKG9XpvrzJFsvhZRkiOhUb37vJUuk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puHfzcopYTG4NfFiyAOCTcF8quhKn24B78DELoL7CTominIdJkDTTSUvPHH4K0FbWMY4xHrbwTQuSUo+61RkbhMkUtVlwVmmqaKZABRGpa2C+H2zkXGjGgwWRtUbGgOSbNzqO4qrXKPsqBR1BLNbCLnFlo4Jmy0ZVoCekFVLNPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i+D4sTUV; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i+D4sTUV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d01663d816so24993985ad.1
        for <linux-coco@lists.linux.dev>; Sun, 16 Aug 2026 21:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786940360; cv=none;
        d=google.com; s=arc-20260327;
        b=MvuIfKy2a1bDCmc2ele7zFs5kYwYhVXFVcEiLb6Mm9z+WgFBZX6NYd1ozZ6n6f4rpe
         wip+w3Lks0Ql/vHlmk72UQtWYax7uTV42uyyWwQNFgMOjlp0VHpZ9adI/ZXEjRXlxMep
         l7N/TyfCrq7u2I+gzwFcJPcLxkLwPBkDT4tAvDuFXSiTl5Dzsum0VTdNHVzX4jI5/e7a
         Trgc1t5NNckkREGd/j2gW2jTm6lZowtWihWBvLvHe4EKEWcysJVTI+/moaFlhEmQRXAP
         odAjKtDIB57ejf6PCPGmArwdSXELz6ZDz4gosSTCr1clFYwOUPaAxbgap7uptX5QlEDx
         DCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xivEul2vQ6DVrmdcX4kLhJE8WzqBo4aY4NPSm+NocTk=;
        fh=qaYIL/z/VJqJhhqyTk3wTk89L3qLimug+mil/sCalaw=;
        b=aqcR8c9HZi5rKWlPk+YnC4xyuYvIDbQ1vyuTNXBviZtzjvMg3GUjoFvy1Q7CFA485C
         fVY6SfgZi16LAhrxCqMk3Gq0eJQlazrxGiSTNdgzB3BJ5rEuZiFOeiKZhG5cg10uoGzc
         WOpIbXKJRigjB4hYDU0GI3rJ8gF04lS3IEgbW6xY/jVn1AKWQa8ZN2ziNxRR1jhs1JVT
         q2iBDULBLYXNOFuqAcTcY6njhAmDXopt7NazH95b/XLFX+BRwxJYq1alsEaTrBk5Ytqu
         vuRTPTzCuK0lJGEiTIa4/izuCBVTomXkD9O31F865ywK2bCUlfz3aiw/IqUakTpPt2zi
         T4PQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786940360; x=1787545160; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xivEul2vQ6DVrmdcX4kLhJE8WzqBo4aY4NPSm+NocTk=;
        b=i+D4sTUVTDjdL+867YztdLAVjCzJTf8UEUACdm4BsxN62bfdahjfciGjvkD3BBWGSa
         SOTQPx3iptaHZwQSw9KydN9Q3LK3uqYgv7MV/fx8KKZAaTvD68W7djHtpfBZjlKgHX95
         qXRryxsdiADAR97OhM3tR80qEAW5GW1cHbdrhgRXFJC7E5C6mrknT8LxmcOVCA2ZGo0G
         VyhBZ9fe1ZJPDJfJogVM3pqGxCKbzQD7pVre1N3DVFNCZNEUZYKxKgcKFGATXP0IX3dN
         qlDuRmGJymzEr2SJNv2YJqbtJgUS+eztd3Sq31r7dEW76J7a6AZRPz/pFQmYOSfMTsff
         TJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786940360; x=1787545160;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xivEul2vQ6DVrmdcX4kLhJE8WzqBo4aY4NPSm+NocTk=;
        b=b/9RPlBIbhaPMtJHawyvpymYXt5OG+nfB6h3/cUT+xo8rYLX/f9mNzszaaFJ3bC0Zj
         hcI1jEURh1XKOf2CRJxXKHiM+gipYRHrW3WwCl0rmrix/0LM89nF59CbH6kbtgzbZSlO
         owrZLlj9DMQCUTT7eqrTRAZveKbDJphiUEX0pdJJNnYbX13FB2mH2aE4EFq0s1pnncaZ
         57x3fdxGtWcwbtrmk8X4/MgvZD7AdoXKupgQ7zxiQrCaqrZYhBoICJqOO3/GeLKl+h64
         uuVsFoTgiMWoE0ovIj8H5BPg1QYiKFl6W/h1o22/EzMJ9z3x7kBq77LBQ/Ps3gLJLmd7
         j+jw==
X-Forwarded-Encrypted: i=1; AHgh+RorBpfcTCo3xseR8DUOdFjc7npeMLlLJsK4MRjvPRiAGiNq7qxw0evqZpMHcvXc7/BmLaSV/IP4qiSQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwBh6aDGdHiscECRejvYv53bmLkcXKsJvslwq9JkImsmRxbl2H+
	9C5Ezs/C5t62SoGImPnb7mElba971qDzUm3sdC4OoKOJUxbMXZT8ra+lnlHHQUKAHyVlCSrbWAP
	DAZrsP09Vo4rAc8drr+ifCgCRDHw2kkHzaOIZXeIb
X-Gm-Gg: AR+sD11aWZT0RnH0f2WjKqhVEA4jB5PNwigHmdZkFa8zxqEDw1MKuB6iB0fpZXJAqXr
	I7owJ+MOkDiuRifEBhBHU4h1q9S1q7CdgT+9QYGkjdTymE4YF1K/n0rDboZtROp7Oeuu5nJ8x7Y
	ThS+lJWsfl2QcvX3LNAAwdYv0hM0x+ybWFpl8lE9QXUZXJeGNBUBIgnuXtrBQLe5BWoM8yzW9Y4
	1wEquRbhg6ARQrO9vhvTiUCBFE4rfsDMaAOrDPzzAFhF/TMRrNfLVBJqg/fI+cnPwjM4dcTlE6H
	ke/FMh2TQO/cE74sxzh2qb52xrc0eajqF3ZrIt881iJLcJWuFRru8CSz6l7O71968yXDemctu8B
	O0QMsCgOoQQNk
X-Received: by 2002:a17:90b:4c92:b0:37f:c28a:de61 with SMTP id
 98e67ed59e1d1-3933b958b03mr19010729a91.17.1786940359155; Sun, 16 Aug 2026
 21:19:19 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 21:19:17 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 21:19:17 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <4828f8e29801adb29a4d48b8980d3b3a0a813e06.camel@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <5a44a6925715e1edbd379ac0ea5526ec990eb819.camel@intel.com> <4828f8e29801adb29a4d48b8980d3b3a0a813e06.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 21:19:17 -0700
X-Gm-Features: AcwNN1VIHmwnnDA2bzacKAIVX0yEdPw0lSMkAp36cPs6xox3IG56dYLMbQiMxOc
Message-ID: <CAEvNRgELDhXvPFKaoz+w-yywoJn0WMWvA-Y2jfdnwJVSbCSWyw@mail.gmail.com>
Subject: Re: [PATCH v14 00/22] TDX KVM selftests
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "afranji@google.com" <afranji@google.com>, 
	"kas@kernel.org" <kas@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, 
	"isaku.yamahata@intel.com" <isaku.yamahata@intel.com>, "seanjc@google.com" <seanjc@google.com>, 
	"pratikrajesh.sampat@amd.com" <pratikrajesh.sampat@amd.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"wyihan@google.com" <wyihan@google.com>, "sagis@google.com" <sagis@google.com>, "Gao, Chao" <chao.gao@intel.com>, 
	"Wang, Roger" <runanwang@google.com>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "Qiang, Chenyi" <chenyi.qiang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jmcrey@google.com" <jmcrey@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Thu, 2026-08-13 at 15:47 -0700, Rick Edgecombe wrote:
>> On Wed, 2026-07-22 at 23:13 +0000, Lisa Wang wrote:
>> > v14 revision for TDX KVM selftests based on kvm/next and guest_memfd:
>> > In-place conversion support[1]. This series needs some changes from
>> > in-place conversion v9. For ease of testing, an extra hack commit has
>> > been added. The complete code is available at:
>> > https://github.com/googleprodkernel/linux-cc/commits/tdx-selftests-v14
>>
>> Are you able to get sashiko review on this? Or did you internally somehow? It
>> seems the public sashiko cannot figure out this stack.
>
> Actually why is this on top of in-place conversion? I thought the idea was to
> break the series apart to get something basic upstream:
> https://lore.kernel.org/all/aJ-6JpHD6xhAvZPy@google.com/
>
> Adding in-place conversion tests seems to be going in the opposite direction.
>

We wanted to have this series based on in-place conversion since
non-in-place conversion is on a deprecation path. Also, it makes the set
up easier :)

At this point I don't think this series is going to make it for 7.3, so
at best it makes it for 7.4 (together with in-place conversion), which I
think works out?

Sean, let us know what you think about scheduling. We can rebase without
in-place conversion if necessary.

>
> Also, the branch does not build for me:
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:26:
> undefined reference to `TD_BOOT_PARAMETERS_PER_VCPU'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:30:
> undefined reference to `TD_PER_VCPU_PARAMETERS_ESP_GVA'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:33:
> undefined reference to `TD_BOOT_PARAMETERS_GDT'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:37:
> undefined reference to `TD_BOOT_PARAMETERS_IDT'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:44:
> undefined reference to `TD_BOOT_PARAMETERS_CR4'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:46:
> undefined reference to `TD_BOOT_PARAMETERS_CR3'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:48:
> undefined reference to `TD_BOOT_PARAMETERS_CR0'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:54:
> undefined reference to `TD_PER_VCPU_PARAMETERS_GUEST_CODE'
> collect2: error: ld returned 1 exit status
> make: *** [Makefile.kvm:351:
> .../linux/tools/testing/selftests/kvm/demand_paging_test] Error 1
> make: *** Waiting for unfinished jobs....
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.o: in
> function `td_boot':
> .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:24: undefined
> reference to `SIZEOF_TD_PER_VCPU_PARAMETERS'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:26:
> undefined reference to `TD_BOOT_PARAMETERS_PER_VCPU'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:30:
> undefined reference to `TD_PER_VCPU_PARAMETERS_ESP_GVA'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:33:
> undefined reference to `TD_BOOT_PARAMETERS_GDT'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:37:
> undefined reference to `TD_BOOT_PARAMETERS_IDT'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:44:
> undefined reference to `TD_BOOT_PARAMETERS_CR4'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:46:
> undefined reference to `TD_BOOT_PARAMETERS_CR3'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:48:
> undefined reference to `TD_BOOT_PARAMETERS_CR0'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:54:
> undefined reference to `TD_PER_VCPU_PARAMETERS_GUEST_CODE'
> collect2: error: ld returned 1 exit status
> make: *** [Makefile.kvm:351:
> .../linux/tools/testing/selftests/kvm/dirty_log_test] Error 1
>
> If I apply these patches on 8cf3969a0b7d4 from the branch, it builds though. It
> looks like a few changes are missing from the branch:
>
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c
> b/tools/testing/selftests/kvm/guest_memfd_test.c
> index d6528c6f5e031..b099b09cbae3d 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -14,7 +14,7 @@
>  #include <linux/bitmap.h>
>  #include <linux/falloc.h>
>  #include <linux/sizes.h>
> -#include <sys/mman.h>
> +#include <linux/mman.h>

I recall a similar fix [1] you posted, I think both Lisa and I are
relying on some LSP auto-including, we'll adopt <linux/mman.h>. Let me
know you know a good way to configure the auto-includes.

[1] https://lore.kernel.org/all/20260427204313.50741-1-rick.p.edgecombe@intel.com/

What compiler/version are you using? We'd like to reproduce.

>  #include <sys/types.h>
>  #include <sys/stat.h>
>
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
> b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
> index b81cd16198ecf..7f76a3585b99a 100644
> --- a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
> @@ -5,7 +5,7 @@
>
>  #include "tdx/td_boot.h"
>
> -static void __used common(void)
> +static void __attribute__((used)) common(void)

Not sure about this, I'll let Lisa look at this in more detail. I wonder
if declaring __used is necessary at all.

>  {
>         OFFSET(TD_BOOT_PARAMETERS_CR0, td_boot_parameters, cr0);
>         OFFSET(TD_BOOT_PARAMETERS_CR3, td_boot_parameters, cr3);
