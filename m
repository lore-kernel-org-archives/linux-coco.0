Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9190FD53B
	for <linux-coco@lists.linux.dev>; Mon, 19 Jun 2023 19:12:02 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6300f6ab032so20554246d6.2
        for <linux-coco@lists.linux.dev>; Mon, 19 Jun 2023 12:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687201921; x=1689793921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVYc5tgS9GuhHSW4I9Rx24JeDuyY6zS9msd6s7vhYTU=;
        b=OnleU7zrZ4EJ5IyP76ORdPEGUQJvFcLOukq8VMDe+wwB+FGyzxbTlaoLKzEjpLPfy3
         MZbQ9QFq06vaie7OdQwrruTdOjItnQ+zYAclJz87yqkQDAaEWgbwvpwWsjBgCDRLZFAE
         jt71Nvx60sycS2/amx/VkoRkjk/371B0lt/rI0UHfiZj+hClNfMtNZzUUlWaXtOFUKZV
         RDmiPgZhS9rWVvjs1DAH67l47h9ov1Fyb86uBVIb+j7Rt7nQVrKAFnCx0564bcXdMxbW
         rKKd1rOoBykB8xwUV4i3zZk6qvg3rpBVKmjtEhwvFpKd3sS/I4ObEqPjguq3163nS9Ea
         91JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687201921; x=1689793921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVYc5tgS9GuhHSW4I9Rx24JeDuyY6zS9msd6s7vhYTU=;
        b=jGBaC9EMCwy5Rf156Ha7znIYzOqAjQltEG3mPKCPWw9TeV7zreW1fw+THZAUu8/6Ks
         cDQ61OXjMmHOmZ4w/5oEYY6YSJi6sVvtAKo+2PTZUxcOpMlygjbFUaotC8S+UHTlvhrk
         QJ4+N+DMpOd+pydsWVbhvmeYMGrQWhGW4OVXmXx2Bx2HFi9WXRci924w8w95Iaqpf9Vc
         nVfwZwDPmUfJa5hQLF5wXDlPQErVg9L/2EgUCHKDOy8QxOwmQY13M8vvmiMdFK0PLh0b
         P880xxuio2J4JLOWf1Zw4MZUGe/x4Uaw1DDEte07Hp627t6ATDmhJKLOYWviUA46DEmw
         4QeQ==
X-Gm-Message-State: AC+VfDzYjzX5yx7XktZZ0nF2D16WaOaiVfxR+h01hOAtfuf18WJhJWJW
	AVYm6WqQV1wm8r/5ey91tIrCfaRL3Trm0MqtLqCjfQ==
X-Google-Smtp-Source: ACHHUZ7v1a0Qp73sX3oTeiKCZI3Bb2g5bAKarlkDAhHHC0BAo/ZJLGYRWoUQn6eothVG18b1p04JXDmu8ZavGfwhsjM=
X-Received: by 2002:a05:6214:e8a:b0:621:331b:f55d with SMTP id
 hf10-20020a0562140e8a00b00621331bf55dmr13680549qvb.19.1687201921127; Mon, 19
 Jun 2023 12:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686858861.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1686858861.git.isaku.yamahata@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 19 Jun 2023 12:11:50 -0700
Message-ID: <CAGtprH8O6dsjjNrMzLPmRio0ZDLe6M3U06HD0oNX3NN9FeWQfg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] KVM: guest memory: Misc enhacnement
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, 
	Sean Christopherson <seanjc@google.com>, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 1:12=E2=80=AFPM <isaku.yamahata@intel.com> wrote:
> ...
>
> * VM type: Now we have KVM_X86_PROTECTED_VM. How do we proceed?
>   - Keep KVM_X86_PROTECTED_VM for its use. Introduce KVM_X86_TDX_VM
>   - Use KVM_X86_PROTECTED_VM for TDX. (If necessary, introduce another ty=
pe in
>     the future)
>   - any other way?

There are selftests posted[1] in context of this work, which rely on
KVM_X86_PROTECTED_VM being just the software-only psuedo-confidential
VMs. In future there might be more work to expand this usecase to
full-scale VMs. So it would be better to treat protected VMs as a
separate type which can be used on any platform without the need of
enabling TDX/SEV functionality.

TDX VM type can possibly serve as a specialized type of protected VM
with additional arch specific capabilities enabled.

[1] - https://github.com/sean-jc/linux/commits/x86/kvm_gmem_solo
