Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D5C14A8B
	for <linux-coco@lists.linux.dev>; Mon, 19 Jun 2023 21:55:21 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-62ffb5f6aafso30976256d6.1
        for <linux-coco@lists.linux.dev>; Mon, 19 Jun 2023 14:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687211720; x=1689803720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdzLczGyyyiIYNvTKN6t+nBWF1GzRjK5CWv52ZbiRPw=;
        b=APeY+OLAeUM0ntetAp1LDxTmd/ZT8qV36vebhZ6/VcMwk4uMUUhR800CSyT18vQlKW
         uZrNQ0FXmnmG48copWury88dMkDTPzBwzMO4eHtQcqLUzVlqVbWLjqVkFWoHN7/9nYt4
         gdgeN6/4LPgoMA6mnX7E+CKl7ob64ZJ233kC5FH2SyFdQUNGKTK5tvC1N0UIsrq+T6yn
         HK2AWxXZShhWSMaNeyZIHkrZSssRKkui9N5KvRKfbAdA0nA9UQ3gK6+SPuyPkaTf9Xh8
         yEtrMZykMHE2W08gpiQ9liyy7c+0Bi4srhjg+nU5OCAJPdoY1CcNDc3e2kdTORGk8eX3
         j7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687211720; x=1689803720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdzLczGyyyiIYNvTKN6t+nBWF1GzRjK5CWv52ZbiRPw=;
        b=GuNa67dvVwsUDDkf7BUCq0QyM/ChMnZzM9G4UxRlHjA5/tqtuwwm8GNfYqZHZKM6C6
         pdrNi38U0+L4lKcMdmZliNPasTt5gsf/a3MI3FeG2qUBti410bIAMaOIxWOT4CRiTtis
         C2YtsA2BWTXSFuX/Urp3Tjuy4gLDte0nYunmSdVQ+zEG5FQCTs/96z9rH+CTGHSf9H84
         zjooNTQP1dtTgh4X6rs1ysBlXkthEx014codGRcLyd+TurCq52G4qA8zyxP3X7VpP/Jf
         +eAynIJO7cgU9XgjCb3VF33Zi/XoHL/hLFSI1pnOvNIIWXJLWCby3LZa66tEs9JV9sVN
         Bt1g==
X-Gm-Message-State: AC+VfDyHy3JjTWSW7uO28X8PyLh1Eo7etWfIPwDdlHpHS4mY9OzsIQvK
	M/026Cpkc3iAnbM3qQwd3WX/71KBWA8a059c5J0XiA==
X-Google-Smtp-Source: ACHHUZ6KgfyuctugoVyraKcM8/CJNj0lR3f8HJwxs5YUXGKvuIfI0mQXyJJIMWhpcjZgwCcSiJvSEr/zQ5TDsp+5oq4=
X-Received: by 2002:a05:6214:21ec:b0:615:a18b:d5af with SMTP id
 p12-20020a05621421ec00b00615a18bd5afmr13033287qvj.35.1687211720528; Mon, 19
 Jun 2023 14:55:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686858861.git.isaku.yamahata@intel.com>
 <CAGtprH8O6dsjjNrMzLPmRio0ZDLe6M3U06HD0oNX3NN9FeWQfg@mail.gmail.com> <20230619231142.0000134a.zhi.wang.linux@gmail.com>
In-Reply-To: <20230619231142.0000134a.zhi.wang.linux@gmail.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 19 Jun 2023 14:55:09 -0700
Message-ID: <CAGtprH8jreK52wTcNhoAcBoHKZfkQ_1AYArgb2v6M_YVRYAw+w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] KVM: guest memory: Misc enhacnement
To: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, 
	Sean Christopherson <seanjc@google.com>, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, chen.bo@intel.com, 
	linux-coco@lists.linux.dev, Chao Peng <chao.p.peng@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 1:11=E2=80=AFPM Zhi Wang <zhi.wang.linux@gmail.com>=
 wrote:
>
> On Mon, 19 Jun 2023 12:11:50 -0700
> Vishal Annapurve <vannapurve@google.com> wrote:
>
> > On Thu, Jun 15, 2023 at 1:12___PM <isaku.yamahata@intel.com> wrote:
> > > ...
> > >
> > > * VM type: Now we have KVM_X86_PROTECTED_VM. How do we proceed?
> > >   - Keep KVM_X86_PROTECTED_VM for its use. Introduce KVM_X86_TDX_VM
> > >   - Use KVM_X86_PROTECTED_VM for TDX. (If necessary, introduce anothe=
r type in
> > >     the future)
> > >   - any other way?
> >
> > There are selftests posted[1] in context of this work, which rely on
> > KVM_X86_PROTECTED_VM being just the software-only psuedo-confidential
> > VMs. In future there might be more work to expand this usecase to
> > full-scale VMs. So it would be better to treat protected VMs as a
> > separate type which can be used on any platform without the need of
> > enabling TDX/SEV functionality.
> >
>
> Out of curiosity, is this really a valid case in practice except selftest=
?
> It sounds to me whenever KVM_X86_PROTECTED_VM is used, it has to be tied
> with a platform-specific CC type.

Protected VM effort is about being able to have guest memory ranges
not mapped into Userspace VMM and so are unreachable for most of the
cases from KVM as well. Non-CC VMs can use this support to mitigate
any unintended accesses from userspace VMM/KVM possibly using
enlightened kernels.

Exact implementation of such a support warrants more discussion but it
should be in the line of sight here as a future work item.




>
> > TDX VM type can possibly serve as a specialized type of protected VM
> > with additional arch specific capabilities enabled.
> >
> > [1] - https://github.com/sean-jc/linux/commits/x86/kvm_gmem_solo
>
