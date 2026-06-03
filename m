Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3838B40758E
	for <linux-coco@lists.linux.dev>; Wed,  3 Jun 2026 21:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522028; cv=pass; b=I9IaYV3ie3Y8YwxEfjzUbsXYfYV7bfecJmOqfwypsYlLZk+BwpQxb9Wzc23j++4OT4s/w4P+1iHYHhWqg4ZCoHBvHkJq8g4hyQesLzRGZ7MUTGJlJ3JMKoueC/c4WztpFzwbnKXxFRkmdeHIqTl+iKTSP1QFl9TTRVUxdlHPF0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522028; c=relaxed/simple;
	bh=R6WSQnJIsA+v35uGQtkq6O8mYZ7zBggzE/oxP9twkYg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqbNbktL+HkfLOFpFEH9HlCi2vrx+zd/uD2ke65X15vrGOjekPNgSS18Cr4/H1zgmvjNXOlmT1cggNu1Slo8LXu44+P5Mwc+hxHLhxmLdLzn93bCWOB62NoZb1a/tgVIL59p0/+K9Ujl5v1uZyzOXZPw+IWVDXovt1N2wc1gUC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U2leacHv; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U2leacHv"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-137f0aa125bso36400c88.0
        for <linux-coco@lists.linux.dev>; Wed, 03 Jun 2026 14:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780522026; cv=none;
        d=google.com; s=arc-20240605;
        b=UW2qOQxbiaVFD6x37XR3mpPaE0q7UtDL+4TbEKU/W950/Kr/tMY70lwTKX4XlJiVAm
         G7fOza12OIgSn47RgwPZDCUwZr1qqLjCaOjkHmquY+O5Pcj3/j/SQ70HHDXSaEY6NXg7
         FwaMzMmVvr09Qnmh/Qt8S1xnnkqET8lTSVHMyA1UNGGHCRswphB2MYsXTgtt9Vph4pHF
         7zoH9JLGdCxvHwAe+YkworQo0OnYzziO5/tjG6zvOIzCF6HmUtodM4puwDiqQuM+WU7b
         sosejM+gD8wMGYp/Y00jfw/c8cLb4swN8oUtJwXtuhoM0DODHHb+n6elCpZPxgtQeP9+
         DzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=kXmCClVJ6sffKdNaL7Yv6BlzVuWsmG/JEBjIeBbKKjE=;
        fh=2jootejVtF2SnJYJrpSRxiM0wX/lVi+2t3Q6kPsOFRc=;
        b=I/e9YGj8hfCFM+Ti0LnJawD838gOitIr/1v+q65DOkC8+bN/eM5WZdbwXygX3vZsZ2
         kUCkoutTDdMVFIyL2y7B67PQsU3A0jmV5W3xnVErBZMxl0ZCt3uoP7ZTUqObEv3qVcOE
         0hv05VHoFea5R6GiK/m8TKPld1qtmtzNvJd0OhYlFb/1xuh43FnBTAamOPV/6FiFJS++
         fwfY6Hl//tGlD4EWKZaf8KKbCSRas2XDwtw37YqVgmL/pUHER/yNQXb7lCzfL5kFF4m6
         ydcR+ikOzsetHGgFqKRTeoKf/BtTzkcTClwj38/+yU5MchMskjpB7SZZeRKK1DnbSUoZ
         oflw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780522026; x=1781126826; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kXmCClVJ6sffKdNaL7Yv6BlzVuWsmG/JEBjIeBbKKjE=;
        b=U2leacHvkUy+IUNir4odkyCm8LsNzrRYUYjtKArDbwhvFuN6Dfgz8qgCQ5xEW3loBX
         LXG81J8VoDBWCIMYUL53Yl9HiUc/asM/HeISgapXwyn30coDAwPP1rtCnQjrZXRPTUVD
         9OpuGvxo+4H+GbSDr+CaKKGcIi7li+6TmbRHF+BWSTq6X1+UA0DTjK5E5VdfzmhJ8nmN
         uZrSJrmLr75/YfZ03eIaMP48qRW3ID9L3c9vPezxBAY85SH1ZSzbDpE+HBzq/LfMtVX1
         /1yec/cg5/5sWpEULqWIY/lW8eoKQmFwJwkD4DmcBYGdjCmDYSfePEPlvCmKHVUBBc+O
         A8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780522026; x=1781126826;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXmCClVJ6sffKdNaL7Yv6BlzVuWsmG/JEBjIeBbKKjE=;
        b=T9oGDbHsWACy4l5u0cghkTs+4wyCWeeyV93Rihol500zEwV85eJ3yiqxpb771fg6BT
         PK3ADRuXR9GMuUaW9vuqLigVgG/LQqULU5DoexNpHo6CqrPcHcJ7TJiW5RyKvSSp/+zR
         sabepj5XrTRlOBOOF278cLiXAaaILb1BlLYIl6L8XhBBkNMbO2V18jQC7Q++fmmTP2Vc
         K9gBPhjmd0XQomAT3JHIyLSorE2/AsAIMK1tqLp7wTkpHBTtdwcEB7nwkiGhm0NfCeKU
         ClFtlZPw5m2FxCGyxIdMn5Q7TaXpP0ed2UsinReIi+23iqoXS7X0qSke+jskBDs6yHWk
         hePw==
X-Forwarded-Encrypted: i=1; AFNElJ8pAMVZW7v46mDdFIxEroYIX4pWihgnt+2wA0BSRq21eY7Zt+PzbX04YkIdUn2Jub8FYoDmQt6koRdt@lists.linux.dev
X-Gm-Message-State: AOJu0YwfsJA8zxBcvIYUGDdmd6dXxNDGr4gMsAdz24BaN+aqauKEyAWs
	r3oGnkpP8adU0k5K76tAulZ6oYbTMd2EOX8C9a6cwPYUf9ZomAf5YKhpe+b6QzD+w9Zv+Pes/pn
	/u/EBLUnOt5HMPpnxV/MdrNUZOTmDuLXEUepizhmO
X-Gm-Gg: Acq92OFlqSHvQyHoFA5TsA3bUWrXjA0T0bzd9N/I3VyZlDoXNx7xt+0tO0BkVcSlukT
	qobZv/oSzkZSxv6lph4ptGDS0b4X0eCEaClTdXLTFPCBlt9JHkt7b8Powix3DdtJwS55PmjOcXI
	0lRuiKcPPJcvYRwz1o7W6hsbHAOSuxGJpsyPMchYTLrvDJUcxGptL7cil3bel6aBd96BHboQpdP
	bAQw76dDXWAq0P5u2X3e3evFT4cAcUGBfXKEgbXCQPyLpSG3XsCIBaOCUSCyrVDiCDr8DweEvsr
	PaZrmu07dPHUM0CgUNnWUpqYd8MH2DvN56fi1eq7EmwDi+A2mjyxraGQKXbxZ5R7uU5EsuYBBff
	oqVuVc96pv5g+dDY=
X-Received: by 2002:a05:7022:1285:b0:130:9b78:b17b with SMTP id
 a92af1059eb24-137f6befdaamr2412541c88.38.1780522025275; Wed, 03 Jun 2026
 14:27:05 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 14:27:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 14:27:04 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 3 Jun 2026 14:27:04 -0700
X-Gm-Features: AVHnY4LsErH-4tZ18bsf2DQ3mNo93pDC9YYwJb_gB-LjwgbEb6k0MtNG-ciXWJs
Message-ID: <CAEvNRgGpaggjd3=ooyzv7iEbmA-x1mWJHgjLSjPi8=5CPrk-yQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/42] guest_memfd: In-place conversion support
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> This is v7 of guest_memfd in-place conversion support.
>

Here's the outstanding items after going over everyone's comments
including Sashiko's:

+ KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
    + Need to move page clearing into __kvm_gmem_get_pfn to resolve
      leak where populate can put initialized kernel memory into TDX
      guest
    + See suggested fix at [1]
+ KVM: guest_memfd: Only prepare folios for private pages,
    + s/non-CoCo/CoCo in commit message "INIT_SHARED is about to be
      supported for non-CoCo VMs in a later patch in this series
    + Use Suggested-by: Michael Roth <michael.roth@amd.com>
+ KVM: selftests: Test that shared/private status is consistent across
  processes
    + Improve test reliability using pthread_mutex
    + I have a fixup patch offline.
	
I would like feedback on these:
	
+ KVM: selftests: Test conversion with elevated page refcount
    + Askar pointed out that soon vmsplice may not pin pages. Should I
      pin pages through CONFIG_GUP_TEST like in [2]? I prefer not to
      take a dependency on CONFIG_GUP_TEST.
+ KVM: selftests: Add script to exercise private_mem_conversions_test
    + Would like to know what people think of a wrapper script before
      I address Sashiko's comments.

[1] https://lore.kernel.org/all/CAEvNRgEVC=fFuKVgZYvWyZD7t_zvUZihFG8hrACjvtkD5cwugw@mail.gmail.com/
[2] https://lore.kernel.org/all/baa8838f623102931e755cf34c86314b305af49c.1747264138.git.ackerleytng@google.com/

>
> [...snip...]
>
