Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329651427B
	for <linux-coco@lists.linux.dev>; Mon, 19 Jun 2023 20:11:45 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f8f86fd7b9so15384e87.1
        for <linux-coco@lists.linux.dev>; Mon, 19 Jun 2023 13:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687205504; x=1689797504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yuA7WOugWblk7VPve/a3lyCRdaZ91IbteOWt8o/8/Y=;
        b=o6CBuPZ4IWuSLzap+LsElmAJJf6l4t3BadJ7n9o0jx+xdtI3t7hDWMI/mfducXP/FC
         vH3AK/6nfkumdffEzv0+27BzEGXYJpiigkddezua7+Tv1qoMfneZKXGY1OLA6JqfZQfy
         POKE/vUEzMoyMe/oomUZlH93TMsrhhgv9YE6af/l9hwo1tTaDK6Y1zEggr6hrtkQU6h9
         eSGcpC7Ho4m1EikrVOodXOj6ScFt6VvTTI6FVAQrQ9eBctfwTmFkI3mCHCgaMsXEYVyq
         QCgBrhW8znviHpJE8k4UPqoiNvFiaArZz04hOLFipw/9voQ5pz2r3Xwwo5hfwR4Gv+x5
         qVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687205504; x=1689797504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yuA7WOugWblk7VPve/a3lyCRdaZ91IbteOWt8o/8/Y=;
        b=A5zl/HUMqc6Ewt0UOJLJZf+IMTKn6lrd1loCEEjg1bl1+uJYnacBwW5rLWMZlyzkcT
         TUF9KFxTfsAWnB1wddf7a1fDFE/qvHNfzM0P/0tb6o5+ZGA172sZcHTKBvAR7ghY5pOf
         DdMLYbZFsv9d5x6jIDUOjWHfEVjSSu3WVquJ8EUmp6VdREbHpUq1PySWD2Lq52J4nzl6
         O8jm58RaQNRSLAqCFk+jN8Pn27uZOPYA2mvsNoc46HqtQ+oBo+KpXu1piwkEaZcdRnj/
         zQHOd4XgxPDOeFehC1/sXG3srEmuqekTRjPW8/uF9I5tVORAorH3IBZXxbAMGkU+K8sf
         sibg==
X-Gm-Message-State: AC+VfDw6QX7m25oEE5f9vPQC6wmaRJkgikSjL6lxj/0NFM6SyVnFPoOT
	SzzcPOrqv2HQ7DKh+StVD6g=
X-Google-Smtp-Source: ACHHUZ5LhGegOWOk6HGT1LPLcKzDbkRjM4ARrpu84mXK7W2snqsQypfE+0VsDKuhnQoZLicalDyGsw==
X-Received: by 2002:ac2:44d4:0:b0:4f8:5627:5c8b with SMTP id d20-20020ac244d4000000b004f856275c8bmr4380658lfm.2.1687205503561;
        Mon, 19 Jun 2023 13:11:43 -0700 (PDT)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id g14-20020a19ee0e000000b004f3942e1fbesm70053lfb.1.2023.06.19.13.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 13:11:43 -0700 (PDT)
Date: Mon, 19 Jun 2023 23:11:42 +0300
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com, Paolo Bonzini
 <pbonzini@redhat.com>, erdemaktas@google.com, Sean Christopherson
 <seanjc@google.com>, Sagi Shahar <sagis@google.com>, David Matlack
 <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, chen.bo@intel.com,
 linux-coco@lists.linux.dev, Chao Peng <chao.p.peng@linux.intel.com>,
 Ackerley Tng <ackerleytng@google.com>, Michael Roth <michael.roth@amd.com>
Subject: Re: [RFC PATCH 0/6] KVM: guest memory: Misc enhacnement
Message-ID: <20230619231142.0000134a.zhi.wang.linux@gmail.com>
In-Reply-To: <CAGtprH8O6dsjjNrMzLPmRio0ZDLe6M3U06HD0oNX3NN9FeWQfg@mail.gmail.com>
References: <cover.1686858861.git.isaku.yamahata@intel.com>
	<CAGtprH8O6dsjjNrMzLPmRio0ZDLe6M3U06HD0oNX3NN9FeWQfg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Jun 2023 12:11:50 -0700
Vishal Annapurve <vannapurve@google.com> wrote:

> On Thu, Jun 15, 2023 at 1:12___PM <isaku.yamahata@intel.com> wrote:
> > ...
> >
> > * VM type: Now we have KVM_X86_PROTECTED_VM. How do we proceed?
> >   - Keep KVM_X86_PROTECTED_VM for its use. Introduce KVM_X86_TDX_VM
> >   - Use KVM_X86_PROTECTED_VM for TDX. (If necessary, introduce another type in
> >     the future)
> >   - any other way?  
> 
> There are selftests posted[1] in context of this work, which rely on
> KVM_X86_PROTECTED_VM being just the software-only psuedo-confidential
> VMs. In future there might be more work to expand this usecase to
> full-scale VMs. So it would be better to treat protected VMs as a
> separate type which can be used on any platform without the need of
> enabling TDX/SEV functionality.
> 

Out of curiosity, is this really a valid case in practice except selftest?
It sounds to me whenever KVM_X86_PROTECTED_VM is used, it has to be tied
with a platform-specific CC type.

> TDX VM type can possibly serve as a specialized type of protected VM
> with additional arch specific capabilities enabled.
> 
> [1] - https://github.com/sean-jc/linux/commits/x86/kvm_gmem_solo

