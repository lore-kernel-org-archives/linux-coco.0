Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17417C4
	for <linux-coco@lists.linux.dev>; Fri, 27 Oct 2023 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qs4FRv4Y"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-66d36b2a247so10211646d6.1
        for <linux-coco@lists.linux.dev>; Thu, 26 Oct 2023 18:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698370223; x=1698975023; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVSH8OS2rbVTzonw7nVJgfrvKpUwFf7XTC02uQ6nm3E=;
        b=Qs4FRv4YW/5cbj9d0SVkH3mGeouAy98G9Ktre3fJdxMCtDaDNi2MdsN/ricTe8YaAc
         1uiKcV4mH1qio49LeTyNjrXRKcLCG56mAEZUjvSpUgSGDHeXZ4/mU1J3Hqbn8OYhxvVW
         jn0AokpfXJTtXG44hCGy96Gm/fe0dr4plKR5dbui+bIYPYrFwbHiDzXIdA0AqYS/7aMM
         rXIkqOngpM4zRQ4pmXH0jKQ52d6p90UdsTEacrc9XRCzOP7Qw9fCtU+LYj2cLhWZsb5t
         2rzdUKarEfLcrtoCoyEPY5OQl3PT56UWA+nC3u+Adife3HVNIPxZ65JxIWqIgSTZKqnd
         wmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698370223; x=1698975023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVSH8OS2rbVTzonw7nVJgfrvKpUwFf7XTC02uQ6nm3E=;
        b=QjVsGozNcibsFN4wW3bhhO2mr2xnv6lPG/0dU34fXgB0CHEdKRyPZpjO+an5TBjjlx
         OBnq0fvLGNV3KQFV67DASuLbcYsTih2nLPIk9VelomjLOjUovtwrw8APR8VDvs5e06Or
         zpWdYSOgCdnxq935aOocQl+fwKKA7px4SmMbNLc/dMzTw5REC48H8VefLPBxpgm110Bt
         fgZAgI0U+Z5rtYtlgjdECYbNLVnZuY7XFOpGoBLZEVAQR+01U1S372tbvwujETYCFK+5
         0k6D6N0ChNn0Jqj8HSklCAj9dCaqM8XsOMqjcbs46fCRM4emfaAy3XqjiWa75MClHn8+
         4R0Q==
X-Gm-Message-State: AOJu0YyZnn18zpDsiUjA5/FBawpl7FH8TJKD2eJPs+YBVeuvWeCsOl55
	VFCeaafJpmqTu4MMPAlE+l64bNH0MsZiHs1NS5IQlA==
X-Google-Smtp-Source: AGHT+IE7Y6qzcEixhql3asoC2DQOzJ/JTC3dCr5FDdt8jQCDWFUvRgg0E+4dS741v+gFoQ76jQlNxdJ7TkEyBj3Ev9A=
X-Received: by 2002:a05:6214:20aa:b0:66f:bad6:dccd with SMTP id
 10-20020a05621420aa00b0066fbad6dccdmr231657qvd.12.1698370222884; Thu, 26 Oct
 2023 18:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
 <169776460274.1705513.13197205255470913945.stgit@dwillia2-xfh.jf.intel.com>
 <9483D8AA-82D5-408A-8D17-67916A880982@google.com> <65397556ee5cc_7258329495@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <65397556ee5cc_7258329495@dwillia2-xfh.jf.intel.com.notmuch>
From: Chong Cai <chongc@google.com>
Date: Thu, 26 Oct 2023 18:30:10 -0700
Message-ID: <CALRH0CjCu+11qMV90x5ZmkjeU3SybFTwbY1puTctd7bFRyxEaw@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] configfs-tsm: Introduce a shared ABI for
 attestation reports
To: Dan Williams <dan.j.williams@intel.com>
Cc: Qinkun Bao <qinkun@google.com>, linux-coco@lists.linux.dev, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, peterz@infradead.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, kmoy@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you for your effort to get this important patch ready to unblock
various user cases including ours.
Sorry for any confusion our reply may have caused. Just to clarify,
the goal of the previous reply from Qinkun was not to push back/delay
this patch. We have already tested the patch internally for both
SEV-SNP and TDX, and have no intention to add more complication to the
kernel.
We discussed the synchronization issue internally and with you and
others before, and we understand what is required from userspace to
adopt this patch, which is reasonable. The previous reply simply
serves the purpose for other users to be aware which user space care
they need to provide, since they may not be involved in the previous
discussions.

Chong

On Wed, Oct 25, 2023 at 1:06=E2=80=AFPM Dan Williams <dan.j.williams@intel.=
com> wrote:
>
> Qinkun Bao wrote:
> [..]
> > The patch raised some internal discussions at Google. Some have concern=
s
> > about the potential collision problems. We have reached out to Dan. Dan
> > mentioned that =E2=80=9Cconfigfs puts some onus on userspace to avoid c=
ollisions=E2=80=9D.
> > I have listed the changes in the userspace here to ensure that we have =
the
> > correct understanding and that the complexity for the userspace is nece=
ssary.
>
> I am disappointed this conversation continues to be revisited. Configfs
> is an established ABI mechanism that requires well behaved userspace.
> Configfs is not alone in this requirement which is why mechanisms like
> D-Bus exist to broker a service for multiple clients. Configfs at least
> allows each container to have its own broker which was a concession in
> this effort to balance cross-container management complexity.
>
> Yes, userspace care is necessary for configfs. On balance, I would
> choose to spend my time building a userspace broker before entertaining
> an idea to onboard more complication to the kernel.
