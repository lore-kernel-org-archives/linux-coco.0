Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EDDC8C0
	for <linux-coco@lists.linux.dev>; Wed, 21 Jun 2023 08:16:33 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b07762d292so16754371fa.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Jun 2023 01:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687335392; x=1689927392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkfTMbz8TLgIEiNfglNK3B/35KQ443+5fwdu9oyRTc8=;
        b=WRc0mQdt8tT8orOjTrBku2drWl4tKtybJ3JXwQLmWxhx4g0aSDX5/KaDjzlcrL7jnJ
         Kp0Ye+hmJe9Trl6uLPq2twnK3LyPL2m1j3hU19vTr9hVQQ+iqmbiw6W8NNnpiCbd/mPJ
         Jc6nyJfBRogTkiZvkvQk5Y5UoUucA8WNjaDOqMyODU+prQOJ975Wn6sjwYfR+B9fHz/v
         UmfXKrtoZW8IsdQs0owO5nC8vezRULKohksj0AfVDjBzBhE75TYH+jD752GfrDhtiBoY
         xkKKGIvSAnP3YUhsuIXrO/n2nZJpEcR7pIcAmoKkBj31fdF/3dRIIca2BFbAfB455uMd
         E0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687335392; x=1689927392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkfTMbz8TLgIEiNfglNK3B/35KQ443+5fwdu9oyRTc8=;
        b=XX4DERPiVBcxmzQWQEfCAMytZzJEmbrVGNjORMttEK+HCH9QiAvypFwthrfYqhIsJT
         Dm7nowzjaq+wUssf/qmJ2HWQhXAgSti22326bhFKzX9bHSQ9lg9Ordmfbm/U/gYVRkl9
         SoGjwFqA62d5nUXTJJNNAYR2LB35BxCBc96KoVs/mpV3Ibvw7pzLK3nloPVFHh4n51n5
         UdCSDCQfIiCWBGNYbM9u7Hv/a558VQ4BfshEhicDeuHoqLdANlwwoXwf13sVuB4X2Xud
         8RTWHNBkMIdYp9nBK+Ei5OZt7wMfeniLjdb/iHb6E1mel46lKGbCO/P42vlQDJC77Gmr
         M9bg==
X-Gm-Message-State: AC+VfDznVz2Ssd6nLPWr0uj61+axTbKZtjI5O1VtRTpk4Mj3cUlGXE8p
	fcP5Lve6jD6VXXKdkDkY/pM=
X-Google-Smtp-Source: ACHHUZ5AaVtsGMoIkyho4i8mUBql4cRD55grmmskRymra4oFpgZkcT3ibkYY2IMooWZGLly3WZfGXw==
X-Received: by 2002:a2e:a4c2:0:b0:2b4:666d:513a with SMTP id p2-20020a2ea4c2000000b002b4666d513amr5951239ljm.3.1687335391604;
        Wed, 21 Jun 2023 01:16:31 -0700 (PDT)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id y16-20020a2e3210000000b002aeee2a093csm785230ljy.59.2023.06.21.01.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 01:16:31 -0700 (PDT)
Date: Wed, 21 Jun 2023 11:16:29 +0300
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
Message-ID: <20230621111629.0000045b.zhi.wang.linux@gmail.com>
In-Reply-To: <CAGtprH8jreK52wTcNhoAcBoHKZfkQ_1AYArgb2v6M_YVRYAw+w@mail.gmail.com>
References: <cover.1686858861.git.isaku.yamahata@intel.com>
	<CAGtprH8O6dsjjNrMzLPmRio0ZDLe6M3U06HD0oNX3NN9FeWQfg@mail.gmail.com>
	<20230619231142.0000134a.zhi.wang.linux@gmail.com>
	<CAGtprH8jreK52wTcNhoAcBoHKZfkQ_1AYArgb2v6M_YVRYAw+w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Jun 2023 14:55:09 -0700
Vishal Annapurve <vannapurve@google.com> wrote:

> On Mon, Jun 19, 2023 at 1:11___PM Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> >
> > On Mon, 19 Jun 2023 12:11:50 -0700
> > Vishal Annapurve <vannapurve@google.com> wrote:
> >
> > > On Thu, Jun 15, 2023 at 1:12___PM <isaku.yamahata@intel.com> wrote:
> > > > ...
> > > >
> > > > * VM type: Now we have KVM_X86_PROTECTED_VM. How do we proceed?
> > > >   - Keep KVM_X86_PROTECTED_VM for its use. Introduce KVM_X86_TDX_VM
> > > >   - Use KVM_X86_PROTECTED_VM for TDX. (If necessary, introduce another type in
> > > >     the future)
> > > >   - any other way?
> > >
> > > There are selftests posted[1] in context of this work, which rely on
> > > KVM_X86_PROTECTED_VM being just the software-only psuedo-confidential
> > > VMs. In future there might be more work to expand this usecase to
> > > full-scale VMs. So it would be better to treat protected VMs as a
> > > separate type which can be used on any platform without the need of
> > > enabling TDX/SEV functionality.
> > >
> >
> > Out of curiosity, is this really a valid case in practice except selftest?
> > It sounds to me whenever KVM_X86_PROTECTED_VM is used, it has to be tied
> > with a platform-specific CC type.
> 
> Protected VM effort is about being able to have guest memory ranges
> not mapped into Userspace VMM and so are unreachable for most of the
> cases from KVM as well. Non-CC VMs can use this support to mitigate
> any unintended accesses from userspace VMM/KVM possibly using
> enlightened kernels.
> 
> Exact implementation of such a support warrants more discussion but it
> should be in the line of sight here as a future work item.
> 
>

IIUC, what you are saying is (KVM_X86_PROTECTED_VM == (VMs with UPM or GMEM))
&& (KVM_X86_PROTECTED_VM != KVM_X86_CC_VM) && KVM_X86_CC_VM requires
KVM_X86_PROTECTED_VM.

If we think KVM_X86_PROTECTED_VM as a dedicated feature, not tightly coupled
with CC techs, it seems we needs another defination of KVM_X86_CC_VM to represent
CC VM and CC platform types like KVM_X86_CC_TDX_VM to tell which CC tech sits
behind it?

I don't think it is good to mix the usages of KVM_X86_PROTECTED_VM and KVM_X86_CC_VM
together if we are sure KVM_X86_PROTECTED_VM is not going to represent CC VMs
in the code.

> 
> 
> >
> > > TDX VM type can possibly serve as a specialized type of protected VM
> > > with additional arch specific capabilities enabled.
> > >
> > > [1] - https://github.com/sean-jc/linux/commits/x86/kvm_gmem_solo
> >

