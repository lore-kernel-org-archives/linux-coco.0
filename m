Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ABD33E3
	for <linux-coco@lists.linux.dev>; Tue, 13 Jun 2023 17:03:05 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-53feeb13975so2439201a12.0
        for <linux-coco@lists.linux.dev>; Tue, 13 Jun 2023 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686675784; x=1689267784;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zzy8aEVU/HLeeWa6iy7cIU9ak1rBIlaxwEZFOK1hwFc=;
        b=XrwnSj2LJwucXHLm9g3iOWE0glW2c3TeIzsLg9jpyGqe7qqgdudGESJpTj1cQeK+4B
         gIXU3CiNTMdFDIMqXRPf201Mz+kbhRJkyeEiEoRkwAuW+orAccDxs3P8R+Gm+HbdTPe1
         7G1SPJvp0Dg0frm3TwaI9yo/yMqkC3ac/no0N3HN6t32hzT6NaH8UJmrnZd+8PyXeRQQ
         9UFhwWBhPW3z+2dWxlJS4wBHxYcErN7zZQrsu2joz35o+eRBOzr2tu1vyYqcYzYGvL4l
         WOANgWD44YaGNKOdPmpXFmlJUPipfICb6yVTLjs8G0G8lb+Mym+gRoU/WUBdbpyLDJlK
         Ro1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686675784; x=1689267784;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zzy8aEVU/HLeeWa6iy7cIU9ak1rBIlaxwEZFOK1hwFc=;
        b=j8iL9pckSCEvJ8DABqVYjuzvzFz3iLJRVJOCZjOJWjlrC4gBgnnssJgKYg4p83D5C6
         H8FKmEQFvgWhDle6i1OxxFq9KCeBibsrezIt87DK6dDUdVJVby6fEV9flMXKfEumPrW0
         tpQCoS00WFOWpWQylUiqkv6Hc/9RZMGz4lYxvv7RD5OdlO4OLGte1fX4kyO5KDWArPra
         IQqoa0ZnApGR+fw8urdlhpH9JlZbjyY3lng8D37orCjGiPypVjLWwyNF650W05Fx4uIu
         ZdhS/yYcl02wTyhCbsJpTTzDdRSJPtr/rOmx6EeEslmwGRo3KD5Fs+4Wc0jQrJbyEhpo
         USzQ==
X-Gm-Message-State: AC+VfDwG0T0k+AewDjWXHPW3BROchCr/D7/ARCO1cg7p+VRJMChk2gV3
	detY5fepf446jwlMLZXt/oKgxH5T4WI=
X-Google-Smtp-Source: ACHHUZ7OT77gxrOyF+Q1xmdH9z9fBu36eeSiA+8HAHbpB71BSaS2ab6G6/cPyWQINuDnmCob5Lq9Et/lhIA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:4088:0:b0:540:3370:217a with SMTP id
 t8-20020a654088000000b005403370217amr1948711pgp.5.1686675784414; Tue, 13 Jun
 2023 10:03:04 -0700 (PDT)
Date: Tue, 13 Jun 2023 10:03:02 -0700
In-Reply-To: <20230612164727.3935657-1-carlos.bilbao@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230612164727.3935657-1-carlos.bilbao@amd.com>
Message-ID: <ZIihRqZljMaMRGcK@google.com>
Subject: Re: [PATCH v2] docs: security: Confidential computing intro and
 threat model for x86 virtualization
From: Sean Christopherson <seanjc@google.com>
To: Carlos Bilbao <carlos.bilbao@amd.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ardb@kernel.org, kraxel@redhat.com, dovmurik@linux.ibm.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, Dhaval.Giani@amd.com, 
	michael.day@amd.com, pavankumar.paluri@amd.com, David.Kaplan@amd.com, 
	Reshma.Lal@amd.com, Jeremy.Powell@amd.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, 
	alexander.shishkin@linux.intel.com, thomas.lendacky@amd.com, 
	tglx@linutronix.de, dgilbert@redhat.com, gregkh@linuxfoundation.org, 
	dinechin@redhat.com, linux-coco@lists.linux.dev, berrange@redhat.com, 
	mst@redhat.com, tytso@mit.edu, jikos@kernel.org, joro@8bytes.org, 
	leon@kernel.org, richard.weinberger@gmail.com, lukas@wunner.de, 
	jejb@linux.ibm.com, cdupontd@redhat.com, jasowang@redhat.com, 
	sameo@rivosinc.com, bp@alien8.de, security@kernel.org, 
	Larry Dewey <larry.dewey@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023, Carlos Bilbao wrote:
> Kernel developers working on confidential computing for virtualized
> environments in x86 operate under a set of assumptions regarding the Linu=
x

No, "x86" isn't special, SNP and TDX and s390's UV are special.  pKVM is si=
milar,
but (a) it's not as paranoid as SNP and TDX, and (b) the known use case for=
 pKVM
on x86 is to harden usage of hardware devices, i.e. pKVM x86 "guests" likel=
y don't
have the same "untrusted virtual device" attack surfaces a SNP/TDX/UV guest=
s.

> +Kernel developers working on confidential computing for virtualized
> +environments in x86 operate under a set of assumptions regarding the Lin=
ux

I don't think "virtualized environments" is the right description.  IMO, "c=
loud
computing environments" or maybe "off-premise environments" more accurately
captures what you want to document, though the latter fails to imply the "v=
irtual"
aspect of things.

> +The specific details of the CoCo security manager vastly diverge between
> +technologies. For example, in some cases, it will be implemented in HW
> +while in others it may be pure SW. In some cases, such as for the
> +`Protected kernel-based virtual machine (pKVM) <https://github.com/intel=
-staging/pKVM-IA>`,
> +the CoCo security manager is a small, isolated and highly privileged
> +(compared to the rest of SW running on the host) part of a traditional
> +VMM.

I say that "virtualized environments" isn't a good description because whil=
e pKVM
does utilize hardware virtualization, my understanding is that the primary =
use
cases for pKVM don't have the same threat model as SNP/TDX, e.g. IIUC many =
(most?
all?) pKVM guests don't require network access.

> +Confidential Computing adds a new type of attacker to the above list: a

This should be qualified as "CoCo for cloud", or whatever sublabel we land =
on.

> +potentially misbehaving host (which can also include some part of a
> +traditional VMM or all of it), which is typically placed outside of the
> +CoCo VM TCB due to its large SW attack surface. It is important to note
> +that this doesn=E2=80=99t imply that the host or VMM are intentionally
> +malicious, but that there exists a security value in having a small CoCo
> +VM TCB. This new type of adversary may be viewed as a more powerful type
> +of external attacker, as it resides locally on the same physical machine
> +-in contrast to a remote network attacker- and has control over the gues=
t
> +kernel communication with most of the HW::

IIUC, this last statement doesn't hold true for the pKVM on x86 use case, w=
hich
specifically aims to give a "guest" exclusive access to hardware resources.

> +The **Linux kernel CoCo VM security objectives** can be summarized as fo=
llows:
> +
> +1. Preserve the confidentiality and integrity of CoCo guest's private
> +memory and registers.

As I complained in v1, this doesn't hold true for all of x86.  My complaint=
 goes
away if the document is specific to the TDX/SNP/UV threat models, but descr=
ibing
the doc as "x86 specific" is misleading, as the threat model isn't x86 spec=
ific,
nor do all confidential compute technologies that run on x86 share these ob=
jectives,
e.g. vanilla SEV.

> +well as CoCo technology specific hypercalls, if present. Additionally, t=
he
> +host in a CoCo system typically controls the process of creating a CoCo
> +guest: it has a method to load into a guest the firmware and bootloader
> +images, the kernel image together with the kernel command line. All of t=
his
> +data should also be considered untrusted until its integrity and
> +authenticity is established via attestation.

Attestation is SNP and TDX specific.  AIUI, none of SEV, SEV-ES, or pKVM (w=
hich
doesn't even really exist on x86 yet), have attestation of their own, e.g. =
the
proposed pKVM support would rely on Secure Boot of the original "full" host=
 kernel.

> +CONFIDENTIAL COMPUTING THREAT MODEL FOR X86 VIRTUALIZATION
> +M:    Elena Reshetova <elena.reshetova@intel.com>
> +M:    Carlos Bilbao <carlos.bilbao@amd.com>
> +S:    Maintained
> +F:    Documentation/security/x86-confidential-computing.rst

Throwing "x86" on the name doesn't change my objections, this is still an S=
NP/TDX
specific doc pretending to be more generic then it actually is.  I don't un=
derstand
the resistance to picking a name that makes it abundantly clear the doc cov=
ers a
very specific niche of confidential computing.
