Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C63AFD16
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027927; cv=none; b=KYEGVXDRd0MthF8aISqhcR+f2bl0cuW/MFDMJV8hJLgCx+1yGUD1R2qM1QtmORvjGzLlTqPP36mtduLo9jvFcnMoJZYt1DccMPzLbsBdhudpPWNDNsBzp0+6cTwdwc2Pc4YTU2FQlLaNfBXD3i+hvBLLeZhkOrPSXuiUMWkMrmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027927; c=relaxed/simple;
	bh=oQnCHtOLAC2VK421zR3NYbi26SLJxa0u/brSYBeX6uo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oyQ4sTJv2+Z+3OtQk+yJexWKfVsJaFr6qu+Nmme1soheYdc/x+kfDDS+wqO7ZOpFhTKv3FOrSIjjNSuxJHiNeskCqXObB7vue3bKL6K8nUPLIWrzRZkiW/Om9W0vAUbrzfi7rpm6ZBk1IqmpziDXX+N3fgubAR33qp17sPfJpfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLmyTnAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4oIMQnS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLmyTnAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4oIMQnS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKeUFQ2261037
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4FuUHpGIZcp5Oatw0o6fh2s3f4mtV+T4R77+69YOVc=; b=ZLmyTnAZCsDJbxf9
	oqVbVpjtTsP7rUB66vDktHclSGqyjK9Pz/QB59+mKZ354Rn0zo5yxCjo+UawpXMo
	UUimFTofLn+raC8bHrpZunkJOyFlF8d9QTRy7ypZ6i25gigEbbhtMk6vtw/2nCRe
	VXc4f7d/2cbHyzchfeEn6IsybHVLAHIHZH4mF565ma6n5M7aQoRQAn/Gm8plOfN2
	cdCW0+pgNkqJyqt1EuDSixZud/wGP3TrUS8La5r+Qa/+Ar/dL17IwSZIO3hO41ww
	R1YD7d5+xjxwi2iyd3E5/WD2EeAr0ukcw7ds6+eqVan7S2Da9cdW5vN+8OZi2vaK
	gO2b0w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w791sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:58:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so43252185ad.1
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 14:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790027924; x=1790632724; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G4FuUHpGIZcp5Oatw0o6fh2s3f4mtV+T4R77+69YOVc=;
        b=S4oIMQnSsUbPfjdmWlcP/na7UEwNYFZRr8jzMyoZzXunug+TfqGSAm7fJR9PMomeS6
         RWk5yYonlTG/OtZsp/g/zgBS/VUJs0iDbZOku7zhdJmQW/bLT6Y6ibbKEuV1QycOiaSg
         apMGwa4j2C3f4FvBNyAni7xuDSfjwWqdsz3/qGpIyKbloijcyuwlOJZt/bZ/kvANVOae
         5u09IAm9krY2HnoV1EVuYKHeFc1c4nLN9uMEMfrcoXdiJkxRr4Opoirr9Xy1hEeAFnU6
         qUc9trSidI3eq1rgvq9s2BDWsRWJK9S4qOjSDI6nLO2t6hZ7G0juwUQIhyjq/85HcUp9
         yWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027924; x=1790632724;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4FuUHpGIZcp5Oatw0o6fh2s3f4mtV+T4R77+69YOVc=;
        b=nRWow+5nSD8iBhCsPHo9KoM4moiCm1dlBNn2e1kS4IVr5gJv3jYvectqG+92PQLgBO
         AQvlIBYwJBwAkHwIyvgHSdDMUEuLvMbFjBHIYO0QByy3Ei2LrHJ87YON2abWIP/PciWa
         CD6VugaOmKQitvL3cOmu+76eO5OX9yEUBuKaZucI/diYp7r3XGT3Ij41dxOgUSp+JhyJ
         71ck7NvkgCOVzT8hIDyDo+VL3/Xdpg5P2bBn6n26Ixsm3YRRlxbI18b7JfNM4cuEdwLf
         SCwx/VcDAqMqrcmRfRC8cJoVMMZRneFYiYWik3/wLjPEjULScLNgbKxn0yQIiYahJ03b
         UqSw==
X-Forwarded-Encrypted: i=1; AKwUvBynA36qLcHHLBcShj0WNkFCJNsVCuCc2FtMDgBKdiRnlKYPEUn4l/zwh/3Oca4nkKBC069hLbNLAa+B@lists.linux.dev
X-Gm-Message-State: AFuF++mOjVaVDtdIwA5cfNWq5Qal14zjZpYUXVnyrw0v9VZW1r/NpZO7
	IRRSc1lT65p2MGc8y23SkKz6CPVT+E9DL03xcMgnOHK7ljzK84naXrb22xXBsPnT2owyu8oMC9g
	vdQ2PETFlgJjDVY9cxBX9SYOmIfDGSzSdIY0kB4BJ0Qj8A1vNnU1LbaEmtmoHYIK2
X-Gm-Gg: AYBFou1IDOnVbnUyS6mDScfZxtu1gRH8HvSy41VNC4srL00iRnIweyy12JRSD+LKqEG
	vpIY3d5OcDmwXay2p1J/LBeXrGSp8Wqk9lB2Jpy8c/53QHwsPHLpqDJZf5Vaf5dVRsx671jf/Nk
	fkzOF3fwPacmGZGYEd7/m0FeZNAII1sNBB0SS64pAVDvppWqzmB5Gc9oSIuhebeFAm4/qE0TTtE
	r0tweKb9PGtyk4zb5ialheV/8oCKuADEd+fLjXjdvNubMDDOqXZFR6fkkV9grniHFxo8kCR11St
	n9gNJx1jLIyB3K/lUQ6ZOLnVFkyUSTZKlypse8TjSn+cdZOctI5bsldXuCcwprqWDeB1GbLcL8n
	K9JRuFj/aJ1/ICmvWXCG2rd9cow==
X-Received: by 2002:a17:903:1a0b:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2ddb1b86d77mr166867115ad.18.1790027923998;
        Mon, 21 Sep 2026 14:58:43 -0700 (PDT)
X-Received: by 2002:a17:903:1a0b:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2ddb1b86d77mr166866905ad.18.1790027923453;
        Mon, 21 Sep 2026 14:58:43 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebc658esm835412eec.12.2026.09.21.14.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:58:43 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:58:38 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <20260921145838.00003b04@oss.qualcomm.com>
In-Reply-To: <93aea89c-0a05-4b5a-905d-2e8c14a9e894@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-7-suzuki.poulose@arm.com>
	<178978126543.2352296.12214136703168879825.b4-review@b4>
	<65b0c03b-36b9-4e60-aa55-c3b4b85e21ee@arm.com>
	<93aea89c-0a05-4b5a-905d-2e8c14a9e894@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: eDLuhj6TdUKKJun6Oby91e6YsJZhWSyA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMyMCBTYWx0ZWRfX3RvIORcPTsDG
 PzetA5pmUP9gqw7HGvXJB4hyU3N9IcyX5MVtg1ahy8GJxBodMjMesBDei84E20fpMA2Cd59PLZQ
 am4oEkUn7VYBoWk4wdBQrzcTKum7n+ofMDpNhu3x9Sjvwa62uUvH/2oYGYkMb50NdBtxPrYSfWT
 2sVVZDy50EDVwzmb8iFuCpZwkCagufpIY7tCc+t07rEgXreJgODAwsOPc1Asnt5a+F/LbdmyV4V
 iqWDpgtyN6Hq3Pr/MZrZ9Hb2yvLKWI5kmhnc8OU9WmPr9jgSQk74vgaj29jZc+KEXVvo2qcMsCp
 OMlqlH6v8Q58J2OzVK/CL917wyrxOyewsVLWQsApn9Y+BvDIXp4aYLzbLYY2p1CdsC4XNBMcRza
 nDODMlHZS21DRA9KWHfqMBQIu7ksaCqjOrZtk0RnKZxglnV7k2GJ7Mzyf1/CVZndKyU2qyoefY4
 Qc7DvRAjg6t2LtkNxtA==
X-Proofpoint-ORIG-GUID: eDLuhj6TdUKKJun6Oby91e6YsJZhWSyA
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab1a895 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=L8e4LJ7mbMe5yfr_-rMA:9 a=wPNLvfGTeEIA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMyMCBTYWx0ZWRfX0+T9SlT2cnpb
 aYtYrcMUfpdS5Yy7EFEODX5U+0NNUKFN9NqEXYZ9KoZZ/cZtDPLtaFZwtBFi6whhUzSy8SYgi2P
 KYdfx7DIIU+jSRTCVFPtT3xN+k3GEy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210320


> >>> =A0 static int __init arm64_init_rmi(void)
> >>> =A0 {
> >>> =A0=A0=A0=A0=A0 int ret;
> >>> @@ -786,8 +970,24 @@ static int __init arm64_init_rmi(void)
> >>> =A0=A0=A0=A0=A0 if (ret) {
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 pr_err("RMM activate failed\n");
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ret < 0 ? ret : -ENXIO;
> >>> +=A0=A0=A0=A0=A0=A0=A0 return ret; =20
> >>
> >> Why did this change? =20
> >=20
> > Rebase messed up. I will restore it. =20
>=20
> Actually this is not. We dont have to check the metadata if
> we couldn't activate the RMM. Also, the failure path at the
> bottom has "deactivate", which again is not needed. So
> it is the right thing to do.

Only after this patch? Not from the previous patch?

>=20
> >  =20
> >> =20
> >>> =A0=A0=A0=A0=A0 }
> >>> +=A0=A0=A0 ret =3D rmi_init_metadata();
> >>> +=A0=A0=A0 if (ret) =20
> >>
> >> And this is hitting another bit of guidance in cleanup.h.
> >> Functions shouldn't be mixing __free and friends with
> >> gotos.=A0 Again, not a bug here but there are large ugly
> >> monsters around this stuff, hence the blanket guidance.
> >> I haven't thought that hard on how you avoid it here, but
> >> usually it's a combination of suitable helpers and wrappers
> >> and resulting code is often more readable as a result. =20
>=20
> I could change the hunk to something like, but that looks ugly.
>=20
> @@ -1010,20 +1010,12 @@ static int __init arm64_init_rmi(void)
>                  return ret;
>          }
>=20
> -       ret =3D rmi_init_metadata();
> -       if (ret)
> -               goto out_deactivate;
> +       if (!rmi_init_metadata() &&=20
> !register_memory_notifier(&rmi_memory_nb)) {
> +               arm64_rmi_is_available =3D true;
> +               pr_info("RMI configured\n");
> +               return 0;
> +       }
>=20
> -       ret =3D register_memory_notifier(&rmi_memory_nb);
> -       if (ret)
> -               goto out_deactivate;
> -
> -       arm64_rmi_is_available =3D true;
> -       pr_info("RMI configured\n");
> -
> -       return 0;
> -
> -out_deactivate:
>          WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL,=20
> SMC_RMI_RMM_DEACTIVATE));
>          return ret;
>   }
>=20
>=20
> Either ways, we have to cleanup the object on return, no matter
> the route we take. So the original form is much more readable
> for me.

Agree to more readable, but that fragility of mixing __free() and
goto is a real problem that has tripped many folk up - hence
the perhaps overly strict guidance.  Rather than avoiding the goto, I'd just
not use __free()  - go old school and have two labels for errors
and an extra manual free in the good path.

	pr_info("RMI configured\n:);
	kfree(sro);

	return 0;

out_deactivate:
	WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE));
out_free_sro:
	kfree(sro);
	return ret;
}

Sometime the new toys aren't the right answer.

Jonathan




>=20
> Cheers
> Suzuki
>=20
> >> =20
> >=20
> > I will see if I can improve it.
> >=20
> > Cheers
> > Suzuki
> >  =20
>=20

