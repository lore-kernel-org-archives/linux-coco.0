Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A4F1C2BD
	for <linux-coco@lists.linux.dev>; Fri,  2 Aug 2024 05:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576223; cv=none; b=AduCpJzzP+xolx+3uLRjJP8OUq5klSPOxuCL811GMeZ+2Ll2jje2GpD5QUxJ1obXMrWXZ+cFn+pzGGIO4qwFJLif7nHpTFdsZJBRGNVdjFlK+IqJx9aZmyE4BH/1a7ELXtbUTcetNZ8irD9gn3TD3KHbh2pSGSzg6wfqYxf9HLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576223; c=relaxed/simple;
	bh=dKrc8q/PaPJ0XphwzhvNfe6ax57YdjsDIjAOlUPEtwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=caD6mHue2DlJV0+0AWxY6cVwr5EIoFdXvU3VkUcOuDsusYholgUd/Xr7IbMPoA0+tQNk5W9/RN4AJGeAqVp5KAtj+CfXcSwETZXb15GR7IUYaOv3cnAjtwa9M3fMAL95LRV/bDlc0AxbGpXPlD1QoLxYsTF52SUQ8r87SMPLwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fQkk7EQx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fQkk7EQx"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so45684a12.1
        for <linux-coco@lists.linux.dev>; Thu, 01 Aug 2024 22:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722576220; x=1723181020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUkHiEfpCJ+cVRCtEwbMAEZ1/PiOksmLFdGOaJ89ffs=;
        b=fQkk7EQx56S6uWxdhNHX5TWFv44uBdIq1FDRjec6eI8/uLI1FFRkottusHq0tlyFgs
         m6Erp3PyxVln2tWyOH/rSFe9hlsk+6Bn2t05QmmE3doMK488Y/iw4BUVN8No+1wskDfH
         c9JXDEzgkYs3yLHzIDRMqN+bselpGHcYGNAcLgjNjs3/b1ARf2MlwafVOo+FoDLtMbpC
         ZbdGYd0rYJ6YzA8IDTm+AIfPhsY3SRYpOPv8+AP2Bjo9JGsFaoVFosGHYocwk2tjgrQe
         EjUmNlgf7T0QH0QP0G//09VlS8l+TGNHyp6nre7Ujecyt3N4Cp3w+EkUx3Sg1MZHzhjn
         9SdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722576220; x=1723181020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUkHiEfpCJ+cVRCtEwbMAEZ1/PiOksmLFdGOaJ89ffs=;
        b=Rqfc8P+osEqX4UWmnUziqmYo8Ir3zjZp8O0eLJ2MOsoCNOsvUm++e7rugNsnvbj7MS
         q2/PJm/8gkXFPU4xNXw4QCJ7rCvmTZwZKTkR0+1THQ7PY3kOH9S2U0J+66sis3GVgKoX
         R0YIElJDxoELQFwpjEKO0J4xznMHRu9rwyVHaU313DEPiex4w4ARLXWwM/D01VgqnGSM
         fvavpV+3DbMvoEOynkNS/SUjlrxdDkWPBAX07+nUHwwEM6vst5xu3TgTTJLB0c29mYSE
         R7xcPhmYjZ0T25nfZZUyVV95lb3p+4W7LHjRzw5mFKHp4PtboC/25zo4Ebl/0gBJBb46
         hjOw==
X-Forwarded-Encrypted: i=1; AJvYcCWPGpMzoUYbwrQmT73SWO1+holTPoe0ejCLL7el04sxc7CCAoR9b/WTZXlTqgA94ezYgsgJopdRmYerfWdRoCCynmtJlKEY7YhaiA==
X-Gm-Message-State: AOJu0YzErguo/W1mZAKR6L2VwJDzsYfUuOsW8w6SZb+K57rUNZBnhNo2
	E9GmCelkeJpNUuOlW2HsPxirCuAglqF4TOUOvj6qvgQnIPGoHdYmQcBXEny1d34BLzI41a6l+TF
	cR5TStA0w9ZdaDl0LoDCe6m5pGpvF/MLt7RVZ
X-Google-Smtp-Source: AGHT+IHZfdxzcVupquuH+mbEQsYfwiXcnEVf313JJBssnE3oDDjDXs61gvGQTCu/Y/7+drQ9x949r91Krj68d81dzA4=
X-Received: by 2002:a05:6402:40cf:b0:5ac:4ce3:8f6a with SMTP id
 4fb4d7f45d1cf-5b86bf8e337mr67440a12.6.1722576219642; Thu, 01 Aug 2024
 22:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 1 Aug 2024 22:23:26 -0700
Message-ID: <CAAH4kHYCAwsSk_NTdQpYKisG2o2AMd-8rsy8x=yPJYWNREMD4g@mail.gmail.com>
Subject: Re: Coconut-SVSM - vTPM support for Intel TD Partitioning
To: "Yao, Jiewen" <jiewen.yao@intel.com>
Cc: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, 
	Claudio Siqueira de Carvalho <cclaudio@ibm.com>, =?UTF-8?B?UsO2ZGVsLCBKw7ZyZw==?= <jroedel@suse.com>, 
	"Lange, Jon" <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, 
	"Johnson, Simon P" <simon.p.johnson@intel.com>, "Reshetova, Elena" <elena.reshetova@intel.com>, 
	"Nakajima, Jun" <jun.nakajima@intel.com>, "Perez, Ronald" <ronald.perez@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for this writeup, Jiewen. I see some parallels to the evTPM
paper but some divergences that I find a little curious.

1. The EKpub is ephemeral and fully justified by the TD quote around
it, so there is no need for an X.509 certificate from within the SVSM.
There might be some value for the platform to countersign the EKpub
with some instance information, so if anything I would only consider
the Service CA-signed EK to make sense. The evTPM paper communicates
the "EK cert" by stashing the quote that wraps the EKpub in the NVRAM
index for the EK cert (0x1c00002). Indeed the authors of the paper
already changed Keylime to verify quotes in this form.

By requiring X.509 self-signing, you are now pulling in a bunch of
unnecessary serialization code. For the CA-signed EK, you can get an
X.509 cert in response to a Concise-CSR
https://www.ietf.org/archive/id/draft-ietf-cose-cbor-encoded-cert-07.html#n=
ame-c509-certificate-signing-re
where CBOR serialization is much simpler.

2. I can appreciate the separator events for avoiding an emulation
attack, but this limits your ability to have multiple L2 VMs with
their own vTPMs to be launched at different times. It seems more
appropriate to have a parent key that  each vTPM is underneath, but
I'm not savvy enough with the available hierarchies to know if that
parenting relationship is possible. This would actually make an EKcert
make sense, since it'd be signed by this parent key of the ephemeral
L1VMM. So, not one of your listed options.

This diverges from the evTPM paper since they were targeting SEV-SNP
without nested VMs.

3. Migration isn't discussed much. Do you have a mitigation in mind to
a platform-hosted attack where a migrated VM is cloned? The null
hierarchy seeds would be the same but the VMs would evolve differently
with different traffic and then compromise their security properties.
Maybe the migration TD just accepts a single connection from the
target VM and refuses any extra connection?

4. Clarification question: =C2=A72.6 a new paragraph starts with a
reference to a "connection between them" but I'm not sure who the
parties of the "them" are. Is this the connection of the TPM quote to
the TD quote by means of the TD quote containing a hash of the EKpub?
I could also read "them" as L1 and L2.

5. Clarification question: is the presence VMCALL's response HOBs for
the TDVF to add to the hob list for inclusion in the event log so that
there is no need for SVSM to produce an event log? In this case, why
in =C2=A72.4 step 3.1 the TDVF creates an event for the SVSM version?
Wouldn't SVSM be the appropriate one to report its version? Not sure
what I missed.

I caught some spelling and grammar errors if you'd like me to send
those off list.

On Thu, Aug 1, 2024 at 3:38=E2=80=AFPM Yao, Jiewen <jiewen.yao@intel.com> w=
rote:
>
> Hi
> As follow up, we have drafted the vTPM document and put to https://github=
.com/intel-staging/td-partitioning-svsm/blob/svsm-tdp-vtpm/Documentation/TD=
%20Partitioning%20based%20virtual%20TPM%20Design%20Guide%20Rev%200.5.1.pdf.
> It describes the current TD Partitioning based vTPM design.
>
> The chapter 5 described the TDVMCALL between L2 guest and L1 VMM, to dete=
ct the presence of L1 vTPM service and initial measurement.
> Please let us know if you have any feedback.
>
> Thank you
> Yao, Jiewen
>
> > -----Original Message-----
> > From: Yao, Jiewen <jiewen.yao@intel.com>
> > Sent: Thursday, July 4, 2024 11:08 AM
> > To: jejb@linux.ibm.com; Jeremi Piotrowski <jpiotrowski@linux.microsoft.=
com>;
> > Claudio Siqueira de Carvalho <cclaudio@ibm.com>; R=C3=B6del, J=C3=B6rg
> > <jroedel@suse.com>
> > Cc: Lange, Jon <jlange@microsoft.com>; Dong, Eddie <eddie.dong@intel.co=
m>;
> > Johnson, Simon P <simon.p.johnson@intel.com>; Reshetova, Elena
> > <elena.reshetova@intel.com>; Nakajima, Jun <jun.nakajima@intel.com>; Pe=
rez,
> > Ronald <ronald.perez@intel.com>; linux-coco@lists.linux.dev
> > Subject: Coconut-SVSM - vTPM support for Intel TD Partitioning
> >
> > Hi
> > We posted the initial version of vTPM support for Intel TD Partitioning=
 feature to
> > https://github.com/intel-staging/td-partitioning-svsm/tree/svsm-tdp-vtp=
m.
> >
> > Feature includes:
> > - vTPM CRB MMIO interface
> > - vTPM CA generation with TDX remote attestation
> > - vTPM Endorsement Key certificate and CA provision
> > - TDP L2 guest vTPM detection through TDVMCALL
> > - SVSM vTPM startup and measurement (SVSM version and TDVF).
> > - Ephemeral vTPM NVS
> >
> > This is initial version and we are working on the improvement.
> > Any feedback is welcome!
> >
> >
> > At same time, we find a potential issue https://github.com/coconut-
> > svsm/svsm/issues/404. If you can take a look and provide your thoughts,=
 that
> > would be great.
> >
> > Thank you
> > Yao, Jiewen
>
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
