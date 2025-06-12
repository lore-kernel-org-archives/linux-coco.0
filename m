Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4FC29992E
	for <linux-coco@lists.linux.dev>; Thu, 12 Jun 2025 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744475; cv=none; b=bHJ7GBmXzRIrLQSDpd6cYmsEKNLvIL01WgcKPI4bPwfyz0o9TokuZ22J6MdaKgXJNg6bY2oA0rsvq+BTJOpbXcGIZyRuCPEN6NFUNtL0ZdMN3PkdLLUwPPMIK/QEHwZggMvQKIN4g3pcJ7wCMblKbxW1CAlGgS8aTvRb+lc3iWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744475; c=relaxed/simple;
	bh=beiRkVzN/kqk5kaspq/f1ZG0vgetOiqbsF5PPaV8GBs=;
	h=Mime-Version:Subject:From:In-Reply-To:Date:Cc:Message-Id:
	 References:To:Content-Type; b=QSUB0swZtSZSuqH+u0r1uV7R9DJ2OXGUXtDkO2JZdYknZuI896+63ZGZD5D3VZbvUT1azs+RYYuTsuRWvaPpWG6+BqSP/ahFDbfn2veIkqHEq+otPX9sN4TAGtOnXwtfvOw6gWqgJknSziAWZFvtxskdYQgUW4Q9iW6J2Osfwl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JcM1hfZV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JcM1hfZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749744472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=beiRkVzN/kqk5kaspq/f1ZG0vgetOiqbsF5PPaV8GBs=;
	b=JcM1hfZVeBqgNGCvBIgkgdgJuBgK0heuMXSNtJuTE5r2QkHczZ/Xhz6P+N3BsaJtgURUsO
	gdY6yeJkkESTY3pA7xg5zVPhYCskKdNSS2roWfVMfZoFR2BwqKDFkhcw2Q/mGc33Li04HA
	q9LC/Y9YsPaKZ+3Dxkv5Iu34Csy+LZM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-Mb54HZAPPeiSdQPDI1_Wkg-1; Thu, 12 Jun 2025 12:07:51 -0400
X-MC-Unique: Mb54HZAPPeiSdQPDI1_Wkg-1
X-Mimecast-MFC-AGG-ID: Mb54HZAPPeiSdQPDI1_Wkg_1749744470
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso942151a91.1
        for <linux-coco@lists.linux.dev>; Thu, 12 Jun 2025 09:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749744470; x=1750349270;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5MLprDDbQE3be/UfeySbv6DGokUqSesiMcqyKqo8xw=;
        b=hBy4+lBbTfi+w+aZqH10By/VxRpO5iy4YoDUO2ixFSHL9cxzgtEVx+WlB2ldQ5yxcx
         4llWU9Od4mZutrmacgytbA8rmAiytqMRwM/X3AvWxJ7nXbxw2VCvlJGdWyhfsVxqkXKp
         gWEGPKhg0NXSPXve3NSOqDzgOvSJcWpmBjovRzAVR/gaoASHboD9jBNaYXsROU02HTIN
         T0kHbJr/MpShX52M40qL89VrgKwiOAYQoAmip5atZfwvCBUS90E2B4GiFnhfly0nouoX
         Z9Yg/GOce2maoSFLsgzNwzABkcEBcNJFPU7lWs8w5xLthp2AivcPB3qO1gcUOwT4SI0W
         RVNw==
X-Gm-Message-State: AOJu0Yzd31BNqqMPnfvSm4mwKrlUYFMV6gMaLdC8KuEL0w8S8s795oeh
	VGBoboAGSHpgVdgQudz2saHuwhg66Bv47+vG1GcCPQeZtvVUuZukRrD+WZlNAmnXFqanwsFs3p3
	57bHzpcATphggemTQrg4GVrjCkmwircamNLwMdZ9Rcu1iDs/u+3KmRD6EWdJf/Jk=
X-Gm-Gg: ASbGnctzSflSXEJaFosOYwUBweY38flfD6SB3KBipSMpPB9ODzNEbyQIZSWChwxDvuK
	dytHLqX4RN/AosGodAyZmJ+GrX7NrCU1dvFuK8+QK3RcjUHrWC0/6cfsItuwFsaoCrE2s+EF3SK
	iB/ToU1R1vPR3H7rMU3q1DQQO/oZlnSNbMi8ZVFn8nV+eOiMfrZqGSg4LwA57Pd9xmHfTYkYW2j
	zcTBOVm7iCjRaBMXVTyOvjX6yj051z8FauNHYjpc2/n8eOn+m3wUvJ401BEiGkRps+xsjrn3QdB
	zx3iIk1uThT0b6m94SqRAWV1TDtJwYc5KSLhxw==
X-Received: by 2002:a17:90b:2d4e:b0:310:b602:bc52 with SMTP id 98e67ed59e1d1-313bfd6de33mr5248079a91.2.1749744469902;
        Thu, 12 Jun 2025 09:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdqZgO+ew+xt2q6B0RFnBgDaMIMb0w5Q2m5+bIS9r2XpL2VFHMAJNAGb/ETAGHQkXY00imBw==
X-Received: by 2002:a17:90b:2d4e:b0:310:b602:bc52 with SMTP id 98e67ed59e1d1-313bfd6de33mr5248033a91.2.1749744469349;
        Thu, 12 Jun 2025 09:07:49 -0700 (PDT)
Received: from smtpclient.apple ([122.163.100.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5d80bsm1650258a91.35.2025.06.12.09.07.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Jun 2025 09:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.4\))
Subject: Re: [Cancelled] CCC Kernel SIG Thursday, June 12th
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <CABayD+cxsR_DS9iB10KG4mKFiRiRaY4srpBsTO+0teWrdk4VJg@mail.gmail.com>
Date: Thu, 12 Jun 2025 21:37:35 +0530
Cc: linux-coco@lists.linux.dev
Message-Id: <B96A3601-5E35-4660-94C2-0B6CEE06748D@redhat.com>
References: <CABayD+cxsR_DS9iB10KG4mKFiRiRaY4srpBsTO+0teWrdk4VJg@mail.gmail.com>
To: Steve Rutherford <srutherford@google.com>
X-Mailer: Apple Mail (2.3776.700.51.11.4)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 25x-QUmGwA7SGXXIcc1oL92aV4NCldkPo0YApr2dhyw_1749744470
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 12 Jun 2025, at 3:20=E2=80=AFAM, Steve Rutherford <srutherford@google.=
com> wrote:
>=20
> Hi all,
>=20
> No topics are currently on the agenda, so this instance is cancelled!
> See you all in a month.

Ah I missed this. I thought we were going to discuss IGVM and =E2=80=9Cbrin=
g your own firmware=E2=80=9D along with some ideas for Microsoft folks. Nex=
t month then =E2=80=A6

Ani


>=20
> Thanks,
> Steve
>=20

