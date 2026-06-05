Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF5F33A9F5
	for <linux-coco@lists.linux.dev>; Fri,  5 Jun 2026 18:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684077; cv=pass; b=qThjfp5De1QTH4koOD4WxMjAFV0xVHIhvld7MVOCI+JAWHwbWHHklowB7LdX4ZNJMAq8FqrtuCwjW68zauCqiQvrhfmtmaysOqvrP2Duc8wnLVJbV5hKzN1n3XBYBIXTgtI40bLY/mValz2KIQMtfx+LoL69WKL9OF6XewCxBEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684077; c=relaxed/simple;
	bh=qghMjk2/zrw+UM50raEmfq4OOKU8kgCvFtfkehZ/rgU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgeXO2lUumuNvI0MVA+pYMwAb1EKcWC1DO7LgohnwegOGjuiMFw8J/jGvuyJF66o8hjsuagUYsAfChEHPgg51k7UZPbzhXCS1UCQUntyjLCpjswRmy9NbKDb6AbGvpzbqV/Q8FBXmsjU2ZpUnPXuXj/JPTwAvTWuIzg+nnoc3JM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lqvQwzHP; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lqvQwzHP"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-137dd5161feso4610970c88.1
        for <linux-coco@lists.linux.dev>; Fri, 05 Jun 2026 11:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780684075; cv=none;
        d=google.com; s=arc-20240605;
        b=AvGwi//rrn9viI4o/SYhwV6tZbzpmmvvy2uLImLPHSGmLhEqg8Gve1/VuJsa33N5Sv
         2SZqcXolsP7WqFed7mIsaCW2eDrtcmC0LvEZkOYBavT4vFvXpOg/5rA4CRpnb3+g9W2G
         kbm0rOxkdXDfU3WyG3b+SLKrq/pugT01G5IK2lA3xgXG3QH3fhjIL1KXFaRbb00Ku/ge
         agatsX+0n+yVBhD5ksKuPWOcrGTBu0obS5InUgCkeWdSSji6d9H/vqXDqA3KUQM2SXFw
         CcNJVKy690o6zNiCU9/StwVR4b7P508NrEEAPIigFPVTBr/2HuvGJIKBDIsmzw9Dplke
         jPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dLObr/KEp5oER/6NT5iKluoOpXC19X4vI0a89/66/6Q=;
        fh=YwC9rHbuqd1LJThYCfzk0lK9Mq82495IO7rExZrmdxs=;
        b=KGbRyvmBR68qhROT/2yl+jzH+S98/0lwgyBdkODk+x1u7xpEZFI1oZ4RZvUZnsrhTr
         wqro0AgIq9wDb/Rfp2a/qXwPgi51YBO6aPOJJOd4PadZpo8OWMl34PPagSRjz12E860v
         YB2BlHBTAXbockq7PPxeBTJHIoFAdMKpGIyrYlU7LHVGZL+q9Fecwpv2dFNfw92TYmWa
         JAiOztNDxKqBeUyY/xUVC5A6K6oSzUktC3+8+HZoJOJpCTGlT1YamZRzAiMlDvhiceK6
         4P6xk8Hn+esZ6AHGv71Ga5UghG9SZUQGe8Xcbk8JYzvB0ZzGOlopIT+kvJejyOMU3RNH
         i+qw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780684075; x=1781288875; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLObr/KEp5oER/6NT5iKluoOpXC19X4vI0a89/66/6Q=;
        b=lqvQwzHPmLzYeAam2vrthlLTY0qTwWpv2w3TJJu+Vmc1xbcXcQ3SlXQXNMfjo4gok4
         WEsD3CdwVMAplv3J0Kbcz0sGsVzrs656XQgt1TSO4Qpgw3qfgCc5gPm8Etlb9Nkc+YVx
         oHVerLw7lLmlt0o2/oSqq6XytrCpawld49i1LuDO23VKNtZeL+dXlYAM+uF45jllF4Mx
         5nWq1spV2t7ApXJKhaxvJY/T8yHVnurYX8X6ScjZVrh5DvaBTGXTaJ70zQKK9ouTk9sU
         c2t3dy4HR6hKEtwIoQLIrhr/MUI6GK5Ea1ylye/u8z3ZRB+/UbEBA1bm9mxuG/yXLmsx
         mOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780684075; x=1781288875;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLObr/KEp5oER/6NT5iKluoOpXC19X4vI0a89/66/6Q=;
        b=Ut3PwniSaXht+yDZeuVznMK/KCGshfneukVfw2REhP+XPDKVOu4WLo9kEEmVzC3RL2
         ekW+adY6lddYHzRjMAIrdRrzgnsvJ8XjCE8wjKMFVZSoSJ7gaR1ByuDwU7PSDCfucPip
         o2/c1wkJjIU1Ove4TvF/a9L+WJv0DSBAwlaU+/7dCe1G8JdlXPWqCr9Nbmbgs5K+YPEb
         bw5VQj4d3mNAjTuJxeho4WFm2Wb9Oy472XliX+aNlZM+OrBlpMv9ra9/06qC+Hu8YpX3
         vgN7DL4ss1KjK3MHWVru3BGs0xN7y1+PbD8G7XMnWV7jY8FXP5AK0NcCpIibu8+PtcmC
         //iQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BtXhngr6YxcyJ0KXkVo4t3tmRjhHf+pz3899XVCs1/awIwMzuz7T8CJU744DpMCbMte1WIQ/CZSHZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+hJFc+8aMAO51GwG1+jt60qfd4dBy5XYad2JbjA10DXoXUMSE
	ZqUsEZgFvydde+C7s6tOlr2Hlfr0U1ZuPMAmI5DSpQ5Tk8wJam2PfkLf6ndFP1U6QC0aRgpxVNL
	G2ftGVWIrhCXHkA2/UpzfZ9VJO1BETrzeoE1FfmjK
X-Gm-Gg: Acq92OEnRkQnJornQQIyLpOQQVCvBHK+ADSDrg57Yj5U0depHLjvjt8XACNxXtuDgox
	Kns48mBbl8rzWn6ZKuO2PoJkl/NyxcseMvt4427NrLd+kCnrau75YK3xxFC3pV3R0MTK3bXFuZH
	gJO8bIkbrSRho/DGG87Pp3ewHVPutMf9MtQwUVzLEdfeQH9UAsM1nKsn2/lvYoC3BkfBFfp9feO
	5RGl2Qh4biHzfGOs0zwrBI5o3L+k7mCtZI1FZYb4xs4yBsNLod4NrhkSwfRxrpgC2ozDY/D8odW
	O+K8ANEYMhXPwUyoa6/17TZUOA3ryM74gdbdA7Le0qV9cRQqGWXfs2OsksHOQKNP9tTv4JBF2GP
	Nl3P/
X-Received: by 2002:a05:7022:fb04:b0:135:52d3:d9de with SMTP id
 a92af1059eb24-138066c7823mr2585769c88.15.1780684074557; Fri, 05 Jun 2026
 11:27:54 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Jun 2026 11:27:53 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Jun 2026 11:27:53 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aiMOWkiVBqoQDAPd@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-19-6983ae4c3a4d@google.com>
 <CAEvNRgHEq-hHcTivUw8TYBeMu-RpS=Ho4DXaNXKQKLPL_biTgg@mail.gmail.com> <aiMOWkiVBqoQDAPd@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 5 Jun 2026 11:27:53 -0700
X-Gm-Features: AVHnY4JaNveLNYRuMGFSmOEbQfPwORj3FOENwfzBRs6UfWg6-x8jGi2n-qT-FGA
Message-ID: <CAEvNRgF09SfDm=OgbrS8-wpfxbNecQkqAQwf1ELq1jWu7NjbUA@mail.gmail.com>
Subject: Re: [PATCH v13 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
To: Sean Christopherson <seanjc@google.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>> Was kvm_arch_vm_finalize_vcpus() supposed to be for finalizing vCPUs
>> instead?
>>
>> The awkward part is that kvm_arch_vm_finalize_vcpus() is called from
>> __vm_create_with_vcpus().
>>
>> While building this POC to test conversions [1] I only wanted to create
>> the vm and vcpus and didn't want to finalize yet, since I still needed
>> to do more mappings in the guest (and I needed the vm pointer to do
>> mappings in the guest).
>
> Hmm, I would argue this is a flaw in the selftests infrastructure.  IMO, as a
> developer, it's quite surprising that the current value of a global variable
> doesn't show up in the VM automagically.  I totally understand why selftests
> work that way, but it's certainly odd and annoying.  If _that_ were solved, then
> the kludginess of what you're doing goes away.
>
> The other way this could be solved is by adding support for annotating globals
> with a __shared flag, a la the kernel's __bss_decrypted, so that loading memory
> into the VM can automatically mark the associated globals' pages as shared.
>

More generally, is your opinion that tests should not have to add extra
memslots?

If I wanted a shared page, would I have to do

  static __shared test_page[4096] = {0};

and then rely on ELF loading to put that in the guest for me? Are there
some compiler flags/how will I require that test_page be page aligned?

If I mark 10 globals as __shared, would the compiler automatically
consolidate the shared memory together?

I think it's a bit constraining to require that all guest memory be set
up statically. It's nice to have but I'd like another option...

Many tests use vm_userspace_mem_region_add(), CoCo tests that require
finalizing shouldn't be disallowed that option.

>> Would calling tdx_vm_finalize() from within vcpu_run(), just once, be
>> too magical?
>
> Yes.
>
>> It's also possible to have some kvm_vm_finalize() call that can be
>> explicitly and manually invoked from selftests just for CoCo selftests.
>
> Why bother?  It's obviously possible to all kvm_arch_vm_finalize_vcpus() directly.

Works for me to call directly. Do you mean kvm_arch_vm_finalize_vcpus()
is the right function where the TD is finalized?

For tests that need to do more setup after creating a vm, is the only
way out to call __vm_create() then vm_vcpu_add() to avoid premature
finalization in __vm_create_with_vcpus() when
kvm_arch_vm_finalize_vcpus() is called?
