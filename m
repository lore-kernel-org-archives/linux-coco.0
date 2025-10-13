Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975A026FA57
	for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760377763; cv=none; b=nFye3+q2d+X8u8zJTAlWZpmcEf+g7pSAmsm/XqmAgQD104XeLoMOWsXJF/ILGa2r8IVD0SKp5OHTUNRWJ+a5ArdUPBZTH5c9da/quzPtoMW5W++bkqH9TNctXGqTMwHAeUaCWW3hwwyu+GPXU2Dkxr2UiAjH4sOA607JeqtQECI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760377763; c=relaxed/simple;
	bh=YpOrvarDsgX+BoUcJp30a+73+gS1d+gCoNWkzrol2Qg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DYr9/krVIvx4nsgo3Jlq4I5KhhaHW+AO3dyoHnbXN177LM7Q93b+L9g423ePNu/xO7czW4zuQEv9U547eOhrnYLrdSNcwcJwRdgIPsaE7E6+Rwb99S9/ytZUDq2nGppt/5ICX2gAsoTstmCCHPT0lc0k0q5LYfof9Ou4VcIbh/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LyLbc737; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LyLbc737"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33428befd39so19932935a91.0
        for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760377761; x=1760982561; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LukZPy5/CZdWHCV/h7XbMjLCjzkVUD5w5QgJZZyHQqI=;
        b=LyLbc737pGizUNknK5Sm5DGw3h1tIRk9aELViEzR9e3cWD/OWkL7GLBEnFGNh8TSqh
         nrioVtQcWKRJvqWqKZaaSLO2j5hYyvVLrSf8HjrzTgkBeI6/cf3OAYNUw0rNClPDGzoJ
         ZBNCsai3I2XM5WBYGpyrLqtMs7lx38pnyNS+JuyHGOXhBAYwgwPnS+XKXT2CHSgbZepU
         rwK770WSXftL/qXuKj6afJkNekH7dJops1hca0gmPnTPRw7jxghKum8q19i3U95QEtrO
         JRm5s0yHeTijt086+BtacOOWPgGyg918yzGilknmLJXkpipvlz3H3xaalXWopYAauwKo
         hRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760377761; x=1760982561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LukZPy5/CZdWHCV/h7XbMjLCjzkVUD5w5QgJZZyHQqI=;
        b=Xifqgg+gquEf5EUj7G0yowTB9uhE9KppJ6IfvQAClEzZt8k2IALM9dYmL08LhxJ4UF
         /i1PvRwk9myKKAfH6EcyVao2ZisGRdqH1BKzJnx8js6uYtP8YGb15f3I8OR4qADnZwEf
         L2clFU68E0s2R7Mg1SIWs9sdb1qhT/EN4lDvykkDAjhcOIQ12pmsDD0v5wjfIXiaoRDx
         Mp5XjHW7LiTsMJf3MMK4ah1g5Uc/1KXt0UCL9nX4f58D4hFdghT5EUoGbJOMj3x8NxUC
         7zdvERZ7Xcj0kh/o1pITYSAKj51hPVJjAkg2YDjfXvydtlHttmdlXbtc6W1WI8aMN94m
         55lg==
X-Forwarded-Encrypted: i=1; AJvYcCVcA9tc/zBUMKRrjOtjPdGt2CyJHiLoywgNfqKsIGqwaKsCEl5Gpi1cKpX8N05w43ii+UmXdtbhrTHU@lists.linux.dev
X-Gm-Message-State: AOJu0YzKLe4GQGV5p+9xMieCMxdkYIcrdUMEIdIZcUSK/fj2T7E61E8N
	NdENyjCpnknEYF26TC6QfREYlMtfhcyr5MJDOwQsHJu0+xwpKWJmLlm5Xe/ECKyTSF7oi+x3LR7
	Bjumr5g==
X-Google-Smtp-Source: AGHT+IEHWN8e42GwQBxFY89j15A3l2TcV+QryJNJewInavabM7dzmeX+taQwOLPmxj1PdL/WYv3lcA396qk=
X-Received: from pjbfr8.prod.google.com ([2002:a17:90a:e2c8:b0:32d:57a8:8ae6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b50:b0:32d:a0f7:fa19
 with SMTP id 98e67ed59e1d1-33b51375940mr33870345a91.17.1760377760845; Mon, 13
 Oct 2025 10:49:20 -0700 (PDT)
Date: Mon, 13 Oct 2025 10:49:19 -0700
In-Reply-To: <aOz8gHzmZ8PdsgNw@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010220403.987927-1-seanjc@google.com> <20251010220403.987927-3-seanjc@google.com>
 <aOz8gHzmZ8PdsgNw@intel.com>
Message-ID: <aO07n_1LYtY8Oio6@google.com>
Subject: Re: [RFC PATCH 2/4] KVM: x86: Extract VMXON and EFER.SVME enablement
 to kernel
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Dan Williams <dan.j.williams@intel.com>, Xin Li <xin@zytor.com>, 
	Kai Huang <kai.huang@intel.com>, Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 13, 2025, Chao Gao wrote:
> >+void __init x86_virt_init(void)
> >+{
> >+	cpu_emergency_virt_cb *vmx_cb = NULL, *svm_cb = NULL;
> >+
> >+	if (x86_virt_is_vmx())
> >+		vmx_cb = x86_vmx_init();
> >+
> >+	if (x86_virt_is_svm())
> >+		svm_cb = x86_svm_init();
> >+
> >+	if (!vmx_cb && !svm_cb)
> >+		return;
> >+
> >+	if (WARN_ON_ONCE(vmx_cb && svm_cb))
> >+		return;
> >+
> >+	cpu_emergency_register_virt_callback(vmx_cb ? : svm_cb);
> 
> To be consistent with x86_virt_{get,put}_cpu(), perhaps we can have a common
> emergency callback and let reboot.c call it directly, with the common callback
> routing to svm/vmx code according to the hardware type.

Oh, yeah, that's a much better idea, especially if x86_virt_init() runs
unconditionally during boot (as proposed).  cpu_emergency_disable_virtualization()
can be dropped entirely (it'd just be a one-line wrapper).
