Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6218D
	for <linux-coco@lists.linux.dev>; Sat, 24 Jun 2023 00:09:27 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-53fd224ad48so726771a12.2
        for <linux-coco@lists.linux.dev>; Fri, 23 Jun 2023 17:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687565367; x=1690157367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LvkJneBy3/YMbwKk609UgSQMNaHvxDfIWkehlJrEmg=;
        b=znEFkvugMo4sImCFfgS2qwCOLArcMdjXNcjLgHOhMC9xIU3DvkzpkMCW6uGVJRd6Ju
         g76vDmwk2C3WSAvIWBDrFYrqVe7JL5hI1Mf333G2jyuGDEvWJ3vhYX8pH1syinbdfDFh
         hbRo4fkBW9WO0wrevYIRn8bU13AZJFHNrhgm9cz26iwq/UtFXuP7fBHX/Uq1dgsTslxR
         9vLiVWcHcP/15wxXU65k3wQ7ne+ORwPRg2o4zVmdcaNjAcndf6ggLs+lIUvj84zgWTyR
         3YTZOyatvBcMtxPQpri0htvOeEZ0rsKid9MVUg672KjGfmiUq1Y501qF79MyFBZ4gbxp
         QEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687565367; x=1690157367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6LvkJneBy3/YMbwKk609UgSQMNaHvxDfIWkehlJrEmg=;
        b=Xyv24ekdW2vvwdtiMnvN2qw2j9y+zfB5LTPNYUGl2uJTWcXxAdxj5UzcGwKK+KQMMX
         dJtbcEDyl32jcpl3QtWYjhrlvDyjy8sGfgBgAv5CjyqljnkpcVk42IJa2tnIGhZcC5sL
         vkDLI4CS2Rj+Yf8RRwpn8mXv0XYuOhOJ+Uww9WIw3y2iicQlEz4Bz+9DrgUh//ydHd5N
         suc38IqSCiYZofDfIJXIvT4qiWTU4hmdbZHsaWYnvAgwV4vzU25H/KcJNP3t9TUn34wZ
         fjFxNDORP3K7nBAdKhgkHpKyO6g3XSZevGkjo5R/T/XAPmo9wK7gM/qZ6bHJtCEICbQp
         jT1g==
X-Gm-Message-State: AC+VfDxGc7OS01ogi0/PWRON1l9ydWDVbCiAkb54+C1s0gPmzZBdbFYG
	qMowk3glZhUGRyatuLmS0ELkpaoUFlU=
X-Google-Smtp-Source: ACHHUZ7GYqhOn7bHUyi6+FrThgCMRPif8Rtwe80QIDWA0IpGY9LZNVqsPFDUF3IV6HL7i3Z8DDrWsIB9vyo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:2f42:0:b0:53f:7713:5e0e with SMTP id
 v63-20020a632f42000000b0053f77135e0emr2662006pgv.5.1687565367474; Fri, 23 Jun
 2023 17:09:27 -0700 (PDT)
Date: Fri, 23 Jun 2023 17:09:26 -0700
In-Reply-To: <cover.1686858861.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1686858861.git.isaku.yamahata@intel.com>
Message-ID: <ZJY0Nudy8ym2kKNg@google.com>
Subject: Re: [RFC PATCH 0/6] KVM: guest memory: Misc enhacnement
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, 
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 15, 2023, isaku.yamahata@intel.com wrote:
> * VM type: Now we have KVM_X86_PROTECTED_VM. How do we proceed?
>   - Keep KVM_X86_PROTECTED_VM for its use. Introduce KVM_X86_TDX_VM
>   - Use KVM_X86_PROTECTED_VM for TDX. (If necessary, introduce another type in
>     the future)

How would KVM differentiate between software-protected VMs and TDX VMs if we go
with this option?

>   - any other way?
