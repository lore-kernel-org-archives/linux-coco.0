Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D29449B06
	for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500938; cv=pass; b=G7tJexZipovRD2R0lOkFu0GK4avz8WrY0sGAnsJUeQLepVJVTE0KsApmz9gE2FVWCLVooMMC9ZXPk3pisikXIsJ1rfvVwVQXBAI/tIRHFRPT9NzooDEI2X5J8z9E6TkFJ/A/AmBPqRyEklIyLqm2D/m9ouZfbv5BlRCslaAbBTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500938; c=relaxed/simple;
	bh=9iP5wCDaS9EpQ+gfjMA3+Yk2v+5OOuRQACmgXFd/pac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHPddgnt3DTfT07nzHT1hR5qXiYimbAedRYN9qkMJeuaqpHC604IVNIAcMM5Wcczif0Dm6Z0hMQgU+ZyKWBZgUURmzxyp53YyinvMAa9Ewjfj5miDPzm4j4Y2MbTx9m+1K4eBHwufWcwE0JjH0cxCgFqdwFXSZ5wNWAdizJMtDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AkyjGoGt; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AkyjGoGt"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff174422so1451061fa.3
        for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 12:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789500934; cv=none;
        d=google.com; s=arc-20260327;
        b=nVwtJZdMmrU1/b+WlAODSue9CraVJ6tzJlyk/tHTKuLcV8CqnRm2LZA/NmP6jx0TTv
         QhptczHo0TG8Oq6lQqMP+pTk/Esu7fCOjKFNWifmT1rXw3ERl2Tx/ehwgGtymUn1hMbJ
         7uNlWvWHA45NNrv/gYJtoz3XHFrdW9XP2VhB0MB+CeBdTqpW3dqO5a7N2NdwkCV+1byY
         Jmn5tpZh/N9sO8uceX1YuH16T6/O8g279fV7wPDaOiywkGyA66xVSIe2Ui6v2PoodujE
         tfedkxg6fAzM/rDlz/5zQ1HfRjmTsF8EfHT2+xQFB4zoJJD4BYqHU3mENmJ60x5X5a5+
         F5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3sluWAJ7si51ldKO+IEOlj7IVd+xFNM1gnjjRPbQIZI=;
        fh=WgA7/luG/6wMJqvCPjYcpv1szOae6Q1d/11m0nHgJ3U=;
        b=CjgGLQd4GtRAq9SVFSCoTgEN0/VRhpAorVf2F0JaqnJZowXPEYhWpGJiqKzCePLgQB
         E5Uh7BU86Pu1BGHuc3zuSYjL5q9ht5M8CCUycogw3YhcRrbdaG/I5NzC/fjFeln1bj1t
         YV7HLRwGrZ44cl4c03Je6G8Ah0fQW807akCOGobENoX9Xnz7a6UU7d/NtBaSaztF9xTy
         D0VJGi67ivA9qxt9OhonDhod8QdLmanKOyx8gPBNMHMT1pz8snc0ZM7JbwMh6vFR17+4
         JuIxfn6Gq9wsocImIAgErmnne8e3V6FzsL0qw4zM3ldEQgWl0zdlHErz6/xmzHF47NOU
         PnmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789500934; x=1790105734; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3sluWAJ7si51ldKO+IEOlj7IVd+xFNM1gnjjRPbQIZI=;
        b=AkyjGoGteUSBLUq33mfpaEwYHWAgdL4oCPO/H+BoaTyoYco1BK7TZchyuwRQ7Kseco
         /a4Ros/+fGG016h0ee9wN1/CEh1vmcg2VqKpbsNKwIQk/ra2gQLN/+Fdci8053oWZKcG
         GmTKc53PzK7lsmc1W23zhehOH83ibgJsMveNLsuHwbhKxyJEwQa6iCVFpQ1PL1l16kSp
         0K69Cl/Q8SWhOMvKBNHfehCPi1aa6zEkjC9PPGGfQ6ThbE9R9FTz6Y5ceTXJ4MS4LrQm
         m/LTRDaOjvExbngU/Do9M6aKNo9RN0sw5PJMNx2UPzVuF9aYNrZWN+y88ZddB8CYJwcu
         XzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789500934; x=1790105734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sluWAJ7si51ldKO+IEOlj7IVd+xFNM1gnjjRPbQIZI=;
        b=A2jBXRbOrwN30NIgh2CJGRhaorPC3yYkeVfAInwvgn/4qTjSbudfMZutmulWnCcW0/
         viINSBR6V4e42r/VCoQhuwyrr05E1QpJ3s/IxQGE8xR/IRWLglKk2PG3Qb2aSx+5Yh9k
         EUgkUvTx9Vj134ubMVa/k+xvzeozkNmRHaY4iLiHFMusO9cNWckf8GkxB5VuX8EEgNUW
         g3MMYNTxt9f8IVK+o/NvnsAnbHZvlCKQ2Zi+TuqWLbEVC+wF1W9AjdAqCnNxhlybTTfU
         D5vF0Dc3bDrdpUbWNlAiKQa64J88UNb/gngje6oG/yAqPbCkv6EUtr+wUiUkLbBfiwhn
         Yi1g==
X-Forwarded-Encrypted: i=1; AKwUvBxd/Jpc5LHbUFe6D4Z01ummKO3j0J/G7L5tSgpczOXwkXFdEMC+EaEc7BrNrUIlJY+2CIri02hvhSgr@lists.linux.dev
X-Gm-Message-State: AFuF++lOqZPu0Khc3+lDXMA+cwWtvkSvXUDhlDHyUUQsjoxTbKGziHCI
	Hn5GhC2qlH2aq9M78CMNAIicXFGtqpysT0H94eYQN7M1toTa9v5zu8B4lEmba216+OSbZYLnIjn
	znQZuVgeH7ba1svkpduceS6xBQUYsQbRshMZKeALC
X-Gm-Gg: AYBFou0swWKYx9w84+EQSw7ZPGG1LJ+4D5wfxCHCnAV1Zo3T+7qbmKtBMIo6zrOZJHF
	t5j0MHA/etj2kGAWuRyjIhx/EIxWEcZQkI9Or3UYLdfFgu0kj009Cq9K62V5/C0C3L138N6duwC
	xoqsTFG4kGyAuTsx8V30b2M020iSzs2S6SRcjW81UIjvQt3gQz1LVdIcwXXqPB1/b3XgKMqh2Sb
	VulpB8bnTBh96LtUA2Tk79L40hP5GWpoRiLiyvAGDj3QX6aGArFeKHZqk6f7Pbg75K3rtISsEug
	wRQbG8WbQrEadGrsBo/hXjWV5J8WDeW8qyZv1XCoUxVE9mGKEnW+KC9AvWebJu3b
X-Received: by 2002:a05:651c:a114:20b0:3a4:9e46:235c with SMTP id
 38308e7fff4ca-3a5c89b031emr21060911fa.14.1789500933920; Tue, 15 Sep 2026
 12:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912083611.2513845-1-suzuki.poulose@arm.com> <20260912083611.2513845-8-suzuki.poulose@arm.com>
In-Reply-To: <20260912083611.2513845-8-suzuki.poulose@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Tue, 15 Sep 2026 12:35:22 -0700
X-Gm-Features: AcwNN1VS3YvKKCCRg1vDnBVkoWj-7p2fofNqSox_wrQ014s5kEA5YUvjF8gr3LY
Message-ID: <CABpDEukTAc1m=g+rZRPPqaTwrvhUJPsFRWpFd0PxZsyWw5mR=Q@mail.gmail.com>
Subject: Re: [PATCH v18 7/7] firmware: arm_rmm: Add wrappers for Realm related
 RMI commands
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:37=E2=80=AFAM Suzuki K Poulose <suzuki.poulose@ar=
m.com> wrote:
[...]
> +/**
> + * rmi_rtt_destroy() - Destroy an RTT
> + * @rd: PA of the RD
> + * @ipa: Base of the IPA range described by the RTT
> + * @level: RTT level
> + * @out_rtt: Pointer to write the PA of the RTT which was destroyed
> + * @out_top: Pointer to write the top IPA of non-live RTT entries, from =
entry
> + * at which the RTT walk terminated.
> + *
> + * Destroys an RTT. The RTT must be non-live, i.e. none of the entries i=
n the
> + * table are in ASSIGNED or TABLE state.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux erro=
r code.
> + */
> +static inline long rmi_rtt_destroy(unsigned long rd,
> +                                  unsigned long ipa,
> +                                  long level,
> +                                  unsigned long *out_rtt,
> +                                  unsigned long *out_top)
> +{
> +       struct arm_smccc_1_2_regs regs =3D {
> +               SMC_RMI_RTT_DESTROY, rd, ipa, level
> +       };
> +       long ret =3D rmi_sro_execute(&regs);
> +
> +       if (ret !=3D RMI_SUCCESS)
> +               return ret;
> +
> +       if (out_rtt)
> +               *out_rtt =3D regs.a1;
> +       if (out_top)
> +               *out_top =3D regs.a2;
> +
> +       return RMI_SUCCESS;
> +}

Doesn't out_top (regs.a2) need to be populated on RMI_ERROR_RTT as well?
realm_tear_down_rtt_level() checks next_addr > addr under case
RMI_ERROR_RTT: to determine whether the RTT is missing or has child tables
that need recursive teardown.

Thanks,
Alper
