Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078C42D03B
	for <linux-coco@lists.linux.dev>; Thu, 18 Jan 2024 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705599789; cv=none; b=dX2IxTsxT3rncHGAgHxwLjSBwIIuOI4BEUJniOusrR8vnAV3syh3UPmeOsM02XnQSFLGGH4DWwDLUp8oxM7AB3Z/n1aYgm5F+4Gdnpmn0wrAfhHNvFk3qx/vdhhDdm3HtJpNIWbdKVrH3YwDTe6HWEP+XM3wUmSKnEuzwoZm5h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705599789; c=relaxed/simple;
	bh=NOcAiExZvR2mQb61dcNah83qN7CavovaR3DLX+XgZEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNlj0rAI9ao7ouUbywnpNuNNd0LlEuMqZL+viV8ImqAvg87WFcCmsgflEx1jptjgvigj6U0LHPUjYSym6M6NRO41WdWae4YqasuYJwe16GLNmUHvnjOsyi5ewS9M36q19iB+D8y7nZwXy9ly3pVA4TYkVu93jx9RFYeUf+Xaq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZFp9L+mT; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZFp9L+mT"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-553e36acfbaso197a12.0
        for <linux-coco@lists.linux.dev>; Thu, 18 Jan 2024 09:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705599786; x=1706204586; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOcAiExZvR2mQb61dcNah83qN7CavovaR3DLX+XgZEM=;
        b=ZFp9L+mTRleciDyEjmFB7NeowAsT6o5+4H0CxkholuV1FiDrvRX0CgxPJSM/NwkU7f
         smLASOWQoWOAljfGKBmqj7TaH8Kch6N2AMIGNYIqJVsgNsdpxLNGOkDmwUCXNm1Ml0Yw
         UczlgHL1DDrBIpE35fpXq10UlfsDAfbbpLHtC2qcS/HQbZj1B0kSm9IZBggec8Sr4RE1
         8z87ne0YDD8wOA9zzUCuC2dSzIwn3HUXeYQ5BRwZWE69oCBXXUnSVCrMZzfU4nC6MoVN
         dwg0+tG6GOOiOnfRNVM/qEuXCMddukNs9QUJYF33ypp2ipn7BYIJoJgry8Ew4kpFjy/Y
         m+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705599786; x=1706204586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOcAiExZvR2mQb61dcNah83qN7CavovaR3DLX+XgZEM=;
        b=aako13rvsK7ZDE47zZqPm0FTLjz/EyyCmbLaE2yyEBbH80NPCwyVWlzN//rsZ+oHki
         5sY3dbxm8ONqz7MVXVGhtAFdbb56NAZ0xHpaK2klxAffZQBWRATUdwqNawkoBKyrLguM
         BpvKP0W7/D23mh5H69qsG39y6jYfF19l/+/ENw8NjeZq2FRc/caFLWu8ZnzOKrmaX7f1
         jhP8BCCsFWSyrHJg5oiYui21bwEsxkCDYZf0n3C7GkIDuo4bfnJMjkld9WZaFPTfRWZi
         q2F18nj5orC061STFvIw2xPVtlpp3NNOEOKWQx6NShm5YHw5B7AWwvIfbfb2EQIVPKwa
         4pvA==
X-Gm-Message-State: AOJu0Yy2w8g1/MJTo2OtrBkGgBoxftzZiPMw7iVVrPWho4g5nJCFp22z
	C+I0XwYtUqDcAYAXgR4427ibywbxtE8HCb1LmT7xqKJRbhZmBZYWaK4DRYIW4WyJGp3FhAa6Lu+
	LTIxhu0w8ld3zMj/n3Tjh1vDOni7+rEhV0O0Z3hUd03shNAqniQ==
X-Google-Smtp-Source: AGHT+IE0AakL/4sUeGb+URi8tBIOtgC2fQnSnJWrYDiK2j7xATlq2bUkk4OH1pRcNoFZDynH19IvzdzPXcB0BJXDBJ0=
X-Received: by 2002:a05:6402:b4c:b0:55a:47a0:d8ad with SMTP id
 bx12-20020a0564020b4c00b0055a47a0d8admr63065edb.3.1705599786153; Thu, 18 Jan
 2024 09:43:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240114223532.290550-1-sameo@rivosinc.com> <20240118033515.2293149-1-biao.lu@intel.com>
In-Reply-To: <20240118033515.2293149-1-biao.lu@intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 18 Jan 2024 09:42:50 -0800
Message-ID: <CAAH4kHb9-7p0z2xgmofiCVkOUgXdkJz89qLPc1DuG0F_Wf4-Tg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/4] tsm: Runtime measurement registers ABI
To: biao.lu@intel.com
Cc: sameo@rivosinc.com, dan.j.williams@intel.com, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 7:36=E2=80=AFPM <biao.lu@intel.com> wrote:
>
> Samuel Ortiz wrote:
> > Some confidential computing architectures (Intel TDX, ARM CCA, RISC-V
> > CoVE) provide their guests with a set of measurements registers that ca=
n
> > be extended at runtime, i.e. after the initial, host-initiated
> > measurements of the TVM are finalized. Those runtime measurement
> > registers (RTMR) are isolated from the host accessible ones but TSMs
> > include them in their signed attestation reports.
> >
> > All architectures supporting RTMRs expose a similar interface to their
> > TVMs: An extension command/call that takes a measurement value and an
> > RTMR index to extend it with, and a readback command for reading an RTM=
R
> > value back (taking an RTMR index as an argument as well). This patch se=
ries
> > builds an architecture agnostic, configfs-based ABI for userspace to ex=
tend
> > and read RTMR values back. It extends the current TSM ops structure and
> > each confidential computing architecture can implement this extension t=
o
> > provide RTMR support.
>
> Hi, Samuel
> The ABI does not include eventlog, but eventlog is usually used with RTMR=
.
> What do you think about how to implement eventlog?
>
>

I had the same question and deleted my reply. The event log in TPM is
made available in sysfs only up to the point that control transitions
to user space. After that, all extensions to PCRs have to be logged by
user space with whatever chosen workload event log representation. I
imagine the same is true for RTMRs.

What this patch series doesn't take into account is how RTMRs might
not be represented in the hardware attestation, but rather would be in
a supervisor service whose integrity is chained from hardware
attestation. In the configfs-tsm model, tsm/report with its single
provider requirement will not be able to interface with the SVSM
attestation protocol /and/ the AMD hardware protocol. That may as well
be okay, but that's a choice folks need to be aware of. There's still
the issue of attesting a single service vs attesting all services in
the SVSM. I imagine single service attestation will have to be
abandoned.

In SVSM, a vTPM is a service that an updated linux driver will be able
to get a quote from, and the same AMD SEV-SNP attestation report TSM
provider would still be present, but if we want a simpler RTMR
service, then we're in a little pickle with this design.

--=20
-Dionna Glaze, PhD (she/her)
