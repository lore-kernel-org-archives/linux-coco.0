Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D43A348453
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538546; cv=none; b=JlP5f0ASksP0PNDSJ//mWdNeJ134LyaIUZHprSB19eIPKap88H9hGnhG0hWREIXz9VrgnUz21a/Fa1MBaIS5DMT9J9LNmdcbLYZwfk4jC+4kjxJa3jAt1KmYS9kY0M/lyZ2icTHZiKXOdk7uWklh9kLg0k9kpVoNgQ+l34rG2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538546; c=relaxed/simple;
	bh=LHkQmmIVO12tqfXq5MuBnKiU3Zac/gB4CKobR6v3pWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRRO3/uI6ynNAihWEm+t9zELPw0rvyaOoSoRVlfHsY2+xTzUyz1e0QSeLDrFh0g6j6vLBPgf+EmVrbZga2mYGlUWxpn9F+BhJp9IfA9yInEbC7qNqtAwM0xQFmuLOZKV5L2BRYK/nV4SDDQLTMyWb18J+SEjiJS0N2CPXIHz4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc07wEyf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ14udX+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hc07wEyf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQ14udX+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4Hdd569236
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 12:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RpsE0CluZfRv1K7AmPiInqF3
	1WCTjf8G43ue2nF02Wo=; b=hc07wEyf9hg1I2f1Af4LWb4Jsokg20l/rGEwe5rl
	ocDQF+TuF3htAoKsm/rsEG5gAePzRqwEIesef6OglYL+cgmZ0oO0cHLEmkVy/NC/
	od/eWLXtRbBrFzncpV02t4rKejnDJWGEyoVVVKUk19lNLeaw0DOU0x9WzbZi3Rzq
	PE8ITNEdEC9/O6NBHLb9dYr94tuoY7LL7lEodPo0HX80XPltXc5Er7cRzXl6oTFA
	s7ZNlZ+M2j9erAShKWgECpMmULNV6/RNo75pXhKS6StbHpI9lDodoQC8F+eUWhdm
	Q/FJTupgpj2BCmus5KSB50yen1bgVEbRClGc4d91mRB61Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nut8shr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 12:42:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedfa3898aso703562a12.3
        for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786538540; x=1787143340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RpsE0CluZfRv1K7AmPiInqF31WCTjf8G43ue2nF02Wo=;
        b=NQ14udX+PUUby0bpMaqb/otpOfwdQfCz3z6oCO/7NJKwf1B4ao/cgP0G6wmu/LEzZe
         YOMBxX3iO2c22G/+sLHmkMLd2t9Rc+xaJ6aBRodp2brOlOS4CYiZ0Z2GOCDYXysQGVfD
         qVkLZidLPqIKvJ841D2Vj3Z43n4CsJywzr/CPOKgC24+EJvthzUEj7e5t7hiM69bA36V
         v1VrGCgLqD1IaDwO0EikSVjiTzOpYpjq3VcjC0t0QJnd0yRn+LJdgdrfte7sfz1seFqj
         YBaWPuA346bK2FwaCbZZazOwi443WQWffwMWZwUJT0dE5v3hVdIo4ios1n+3wmyliKOP
         aX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786538540; x=1787143340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpsE0CluZfRv1K7AmPiInqF31WCTjf8G43ue2nF02Wo=;
        b=LILow75pXvKVbhmiPPJuF4W50cBuCXB/TvWqc49SkyIJXGR1W3Ov1Xmcc5rioSbfU4
         6A0Qg9BOaldd1scCVHMABxQZV4c5utradjJmQgsLa6fTMYeOFyFDNCPaScRCJr+1U6SU
         znYamT2qxRGTZEnZu4ikhuHVfqClLvBsBspY2+iDMuHKACLe0MsF5LLylT3PDiEq4mV1
         qqO4ZF4gMoMFMZgsfm54xzXpGVsOa9rVkhD7MTAoQeQQwlbYtXk7J6pxPttVq15Um/8y
         08RHzY4J+OoKFhy8LTahNkPOpUf8umnYizb1PBXnnM+WI4FwwZP0HAfTmn37E+el8pfN
         8g4g==
X-Forwarded-Encrypted: i=1; AHgh+RpEU3peNFZzyEFB1Ig2j7Ro8/cP18gc4WVo52NV4m7wvaKsHrR1Myvbc4RmwkqKHqNK9/c+4PC17NRr@lists.linux.dev
X-Gm-Message-State: AOJu0YzMvdq4A1JA/LufOsrUtuNcy8av4DIL11LTBR59d6mOsIECGD7B
	EgXf43WSSMD9cOwBCgvS3CtfyDZRv63wMXOR63WqlH+K7cnwjl0B/lRnSXFfagBjLkiAOa3bDdS
	sUJ5KHFxVYecxwYh1fRb9Jh9v8QPeUrq4iTqH7EZKkDKmBSfjAc1lYcGOISZ+CW6i
X-Gm-Gg: AR+sD12pXS2UyMKLrqcoo86kXHI+PgVp2PDy87SLCk6qb06XC8fGM29VQDJCuNAgIGX
	UOw8xaVhjd2ZuYxKQbgNO8ZU4i00k09mQLAJgvRnmG0GJ2Px13B2p25SxuhR2tvVL1hApwckrbz
	fmjZaxAf4vXxYtmHlB+glwa++evW2LY+oJg2GkPs+yhVD4kx14SFWBu9Z5KkGGg6rXoqTavOuUL
	QaskqyBosWNgxy+/7b5acbdb/4ClwpubR1fUMyBhmoGAn4lfpAFoT9EA/PVsjGOWt+wMJXXJsOo
	xXgXmVLS6UUx8kr7c9XmGhmNZIupcbOzGqX1xs0fpuznXjxss1ItRTx5zsPEXcf4rhdpWa8EaA9
	qLisClpquGD3ci9k7DhWlAL/3JzmI5eHJjg==
X-Received: by 2002:a05:6a21:700d:b0:3cb:b3ea:858a with SMTP id adf61e73a8af0-3cc3f739945mr5799529637.20.1786538539875;
        Wed, 12 Aug 2026 05:42:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:700d:b0:3cb:b3ea:858a with SMTP id adf61e73a8af0-3cc3f739945mr5799443637.20.1786538539337;
        Wed, 12 Aug 2026 05:42:19 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf628e42asm13617523eec.15.2026.08.12.05.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:42:18 -0700 (PDT)
Date: Wed, 12 Aug 2026 18:12:09 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
        Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Zenghui Yu <yuzenghui@huawei.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Joey Gouly <joey.gouly@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
        Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
        Gavin Shan <gshan@redhat.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Alper Gun <alpergun@google.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Emi Kisanuki <fj0570is@fujitsu.com>,
        Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 07/45] arm64: mm: Handle Granule Protection Faults
 (GPFs)
Message-ID: <7d4e5920-aa20-40cd-954e-037631bd0d6c@quicinc.com>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-8-steven.price@arm.com>
 <ans1ZSwMEKeT9Gfz@arm.com>
 <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX5kZ30MW0QhRA
 ond39ObD34H4z91vosGKqGWp007+BDw8RO+EmmrkBrqWmZ3AG98JUg2hTsNh4RyGN3tefyWHJE9
 jfwSGehGWoQ/SFrKhrfyMnHvphaY+/U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX4zgz2gXy6i7c
 Dn54TRnb9q1O9+2ZYIjKzslZfkXbk09fq9lqs3AtkLKvIiDitsx5pknm8ybeoaAF5dJqHKsTUoZ
 lyas2+jZImlzsp+BtVYbBbvGFbChsLQ4ytujkpoLp8YyAAkbjDhcTz4gjWk6Jd5WaLIBuVEoudQ
 xjUE28prcnlbmQh/z4mWSrmItOMQU4OPxfuQBY3KGjeYUo8vCobUFgdOw3x310aNvpTkmYguXNO
 WvXgrMTj+GUDpDCmWOHxLEIBHCE//tABXC50gFxUkAWkJ11WU3IQhcaZ96E4wAxrwydt52B25Di
 Hen/nEH7zdjzP+UbMq2qjIIr/iTW8nqlTCPn4pKip7ZRsks6/EEqrr/MwEmwX+FejZfsrPE+22I
 dSPq3G/MkAU0+bDictw3ql2aUb3H8YucITnU5R3Itodswzcr7Bz6+5BQh7/ee5Oa4mRA/cemzej
 bLweMQUhx4lZG3e//Ew==
X-Proofpoint-ORIG-GUID: SVb7oFd31zZYbzDem0o9eRcZ7WoRZkNB
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7c6a2c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Oh2cFVv5AAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8
 a=okfElxvwRwk4E0nMkqUA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=7KeoIwV6GZqOttXkcoxL:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: SVb7oFd31zZYbzDem0o9eRcZ7WoRZkNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120103

On Tue, Aug 11, 2026 at 04:11:13PM +0100, Suzuki K Poulose wrote:
> On 11/08/2026 15:44, Catalin Marinas wrote:
> > On Mon, Aug 03, 2026 at 02:43:23PM +0100, Steven Price wrote:
> > > If the host attempts to access granules that have been delegated for use
> > > in a realm these accesses will be caught and will trigger a Granule
> > > Protection Fault (GPF).
> > > 
> > > A fault during a page walk signals a bug in the kernel and is handled by
> > > oopsing the kernel. A non-page walk fault could be caused by user space
> > > having access to a page which has been delegated to the kernel and will
> > > trigger a SIGBUS to allow debugging why user space is trying to access a
> > > delegated page.
> > > 
> > > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > ---
> > > Changes since v10:
> > >   * Don't call arm64_notify_die() in do_gpf() but simply return 1.
> > > Changes since v2:
> > >   * Include missing "Granule Protection Fault at level -1"
> > > ---
> > >   arch/arm64/mm/fault.c | 28 ++++++++++++++++++++++------
> > >   1 file changed, 22 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > > index 85e23388f9bb..ea3ae0ca7dba 100644
> > > --- a/arch/arm64/mm/fault.c
> > > +++ b/arch/arm64/mm/fault.c
> > > @@ -909,6 +909,22 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
> > >   	return 0;
> > >   }
> > > +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > > +{
> > > +	const struct fault_info *inf = esr_to_fault_info(esr);
> > > +
> > > +	die_kernel_fault(inf->name, far, esr, regs);
> > > +	return 0;
> > > +}
> > > +
> > > +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > > +{
> > > +	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
> > > +		return 0;
> > > +
> > > +	return 1;
> > > +}
> > 
> > Is there a valid case for fixup_exception() here? IOW, do we ever have a
> > valid user mapping of the pages delegated to a guest? If the above is
> > considered a kernel bug, I'd not silently ignore this (like return less
> > bytes copied or -EFAULT to user) but rather warn, potentially
> > rate-limited.
> 
> Good question. This shouldn't be a valid case. We expect the VMM to use
> guest_memfd and that should prevent any mmaps and thus fixups shouldn't
> be required. That said, this series doesn't enforce that the VMM uses
> GMEM backed memslots for Guest RAM. We should probably do that while
> mapping things in.
> 
> With that, we could drop that fixup and scream a bit.
> 

There is a valid case for fixup_exception() to be needed here in GPF
handling.

-000 |load_unaligned_zeropad(inline)
-000 |hash_name(inline)
-000 |link_path_walk()
-001 |path_lookupat()
-002 |filename_lookup()
-003 |vfs_statx()
-004 |vfs_fstatat()

We observed this in Android running Gunyah when the page is mapped in
EL1 but unmapped at EL2. path_lookupat() can actually handle this
via fixup_exeption() when a word load crosses the page boundary.
However, Gunyah injects a Synchronous External Abort and we have
a downstream patch [1] that adds fixup_exception() in do_sea(). pKVM
injects [2] such faults back to EL1 and fixup_exception() is taken care.

This patch allows Hypervisors like Gunyah to simulate GPF instead of
Synchronous External Abort for kernel to gracefully handle the 
load_unaligned_zeropad() access.

Thanks,
Pavan


[1] https://android-review.googlesource.com/c/kernel/common/+/2996781
[2] https://lore.kernel.org/all/20260330144841.26181-20-will@kernel.org/
