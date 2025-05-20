Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA4B246771
	for <linux-coco@lists.linux.dev>; Tue, 20 May 2025 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752098; cv=none; b=TjBS1R8ugHRJuuz4rWzIDRBoCLIZUNxCDawZz9EO0GZHQSQ8spn1z7ZKFL33i4/GcRYwliESQKE4FZ/fAvTQ1QY17LXBjI5jGI15p19cnzRbnjLearIX1EG7obhqNcKzPps72jBnzAcf0OUCwl7QAIWKpjWnDQfK9RPagAf6mJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752098; c=relaxed/simple;
	bh=HpfNiTPAANbqe3RbMf12jI9XVS4HyrmhMBmve5e2Xoc=;
	h=Mime-Version:Subject:From:In-Reply-To:Date:Cc:Message-Id:
	 References:To:Content-Type; b=FWGgComCvPCkDmQzGuQJwa3k6X+hVq14RcUfYj2SSzJwdWRjlZf+a8GpERzYnsKoiZ9VX7J3HdLWOVl6EfFVQKCJEYjKzzP4oAqOLZGyAvrqX6AwIItLPpFls8v7ex8gVsIudZlfEcdFIKsSGuc5TVN+peLeN7S0NN2jqDngtIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UGcnEvrM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UGcnEvrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747752095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HpfNiTPAANbqe3RbMf12jI9XVS4HyrmhMBmve5e2Xoc=;
	b=UGcnEvrMSUP9YmTpXJVm0DAW3QOntSRozTGMpKxKiYtsd5O1yBsvtHW5/7KVKlVnXwoqwM
	GBdleN2r1vKAxiOSOBKz6md9ysw9RiPJlac9suzrixSrkmQPsh6PwwzupRt/B1AxV9gZBL
	gHhE4F1JMr2UYLBhp6d942c89bKqFz8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-OD1CDODVMN2DODoY_wvZpw-1; Tue, 20 May 2025 10:41:32 -0400
X-MC-Unique: OD1CDODVMN2DODoY_wvZpw-1
X-Mimecast-MFC-AGG-ID: OD1CDODVMN2DODoY_wvZpw_1747752090
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so4167884b3a.1
        for <linux-coco@lists.linux.dev>; Tue, 20 May 2025 07:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752090; x=1748356890;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcS2SeryfDuJG8EvZLBBrpQADW2521i2kOb8Z2mCLnw=;
        b=SIOqkiLQ0mBALYwfddYrVWIAJ/vtNvYBVTzgevtbOmyEPQZMZGkMyiQOVgnUeubx8m
         FUkPSlB7oGBHKzJlQzPwdgaC163ql+fs257RzmM+6zRrSepSF+oyuFDNcNhXCEB1E4SY
         S4ML3W4+jpkTG5WPHhUWrc8DvYHNN3jcWlQ/HolrMo3QGTYnDjnRPsH0wFQaPk784hBU
         9pRpceIA8Gq6V/MzB3CwIENH9F6FFBzBAQoez1f5pGgud5KuCrljlOCojx8iZduBoJXl
         2bTvYj+IF8Ib+1aFMMmMfRV4zwJD6MxS6kKSzSx+HjNbjlDhq0k30zOAyrPqgbiPklY/
         Et1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJp4B1oyO14/oQ5pKAzhJZ6UAjfa1aF7HAy5VTqYTt9f3Mxog3ajc9payi+4vUAkrT8c/TSAlfYi40@lists.linux.dev
X-Gm-Message-State: AOJu0YwphIr0s8HSVSGoE3IbiTY8vXlGxlz3HqPA01pLPqciG6YaYfui
	zs3c9lsuEu7UgStdDgiYJDHQWijl4pauyFk/c5Q/KFnjXPft/wookEpaSJfv1V6vxlo02W8c+KO
	WgdX1xITQSoFCeGmfhlerHBMV2PvVCag6tEMugm1WoXcfiBob5TidC0XA/kwhnNA=
X-Gm-Gg: ASbGnctE2sF6SYApjOFvj3fCM+U8RNtyfbBqC6+VjvZ8rb5FCiYWvq6jjp6MTC6Q8B+
	fv7aE2myIt5Z/nkGWlQ/lmptpCafJ1fTJQOcUQo1cc9wjMnolYS3Fx7sI3g+Zgam7WxWoEvhzz6
	YoFQy+a6OxwqMzvYYQbSkW/iEvUdFxN+63Sc8vuxnwXA8CCVjcqOpUtq0Rw2CVHCS59ZIotAM07
	qGUW3Bj/WiuZABj9Bgs8O4fNlIPxwDTaMRQC41iROo49x4ANS7rRmkoSUUDL3URNZWsoL3LBgQ3
	aDgv8UKbblfzyTngqiXhtIYntJL7
X-Received: by 2002:a05:6a21:1788:b0:218:11d6:b66 with SMTP id adf61e73a8af0-21811d60d10mr22111161637.5.1747752089596;
        Tue, 20 May 2025 07:41:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoQRkiqsJeUCAA8vxynnl6yjPrrnuScXPjEVUxmdhIQ+GT4giFNiXjm9M08IAcuzyMFyMGmw==
X-Received: by 2002:a05:6a21:1788:b0:218:11d6:b66 with SMTP id adf61e73a8af0-21811d60d10mr22111105637.5.1747752089161;
        Tue, 20 May 2025 07:41:29 -0700 (PDT)
Received: from smtpclient.apple ([115.96.146.104])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm8050031a12.18.2025.05.20.07.41.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 May 2025 07:41:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <95a3e3ca-4fba-411c-b979-4dc8ecc1f902@amazon.com>
Date: Tue, 20 May 2025 20:11:12 +0530
Cc: Dan Middleton <dan.middleton@linux.intel.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 Steve Rutherford <srutherford@google.com>,
 linux-coco@lists.linux.dev,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Joerg Roedel <jroedel@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Jon Lange <jlange@microsoft.com>,
 "cho@microsoft.com" <cho@microsoft.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Message-Id: <64D33153-BCA6-4971-97A7-110504B4AAA3@redhat.com>
References: <CAAH4kHZ2yO3ju_iJinR9y4BDXXdWBnEP1wcv09JWMzaqp1ZP+g@mail.gmail.com>
 <CAK3XEhOs4ijnbqmv8UrNmKN4=nv6+_A7fESLibGBRR9u8rXi6w@mail.gmail.com>
 <87frifm75c.fsf@redhat.com>
 <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
 <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
 <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com>
 <100D7ECF-1292-450A-9F65-FEBA5843AB99@redhat.com>
 <7c650817-09d9-4c41-96db-62c0950d71d5@amazon.com>
 <0E0BB5C5-457F-49B3-A61D-98BCD10CC430@redhat.com>
 <95a3e3ca-4fba-411c-b979-4dc8ecc1f902@amazon.com>
To: Alexander Graf <graf@amazon.com>
X-Mailer: Apple Mail (2.3776.700.51.11.2)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nGMCWUL9V9OHUMc-C6MHpzEJfl7dKhz6RDiDeDO7ThI_1747752090
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 19 May 2025, at 4:55=E2=80=AFPM, Alexander Graf <graf@amazon.com> wrot=
e:
>=20
>=20
> On 19.05.25 10:37, Ani Sinha wrote:
>>> On 16 May 2025, at 2:55=E2=80=AFPM, Alexander Graf <graf@amazon.com> wr=
ote:
>>>=20
>>> Hey Ani,
>>>=20
>>> We already presented concepts last year. If we want to preserve credibi=
lity, this year we need to show a solution that's either merged or almost m=
erged upstream and ready to use.
>> Hmm ok I think it will be hard to get anything merged before the deadlin=
e on June 9th.
>=20
>=20
> It doesn't have to be merged on the 9th, but it should have a realistic a=
venue to be merged by September 4th :).

One blocker in this path is that IGVM support has not yet been merged into =
QEMU. I know Roy (now at MSFT) is working on it and I pinged him today in t=
he mailing list.

