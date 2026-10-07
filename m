Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC834AB3D8
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 13:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380758; cv=pass; b=L706TWKfw+L77gd1qnVQWV8+47QkiFrjgy0COfaQIxiKhBjYBIk0YwA4oiYn8Bo+SqRz1WXFDuRJ3xw/WtVl5Q84SbF6EJXsVNR+e1ayfbv7vlzrZL9qTUzMG/jekmByQFxWjyLpkdrUqN/VlVF7tfPrElS5QbvU2Q72lSAk2aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380758; c=relaxed/simple;
	bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hkf8tiWt4VCgb4pvgdYclyUgTcagKKrHq4Ml/HT0Izdsltl8S4d4Eg8HQkApM+rN8Fjze/htzImoUmUur2RLhAFmVXXSeJ5+0D3fzLaC4kahfEm4/ibBvJLaak4nWtppmQGyvfHBkrTtidIx1vE3lbdDcy/TJvsPRlIqADprBOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ekzjnccn; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ekzjnccn"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so8736e87.0
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 06:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791380745; cv=none;
        d=google.com; s=arc-20260327;
        b=Y1xVGlZQkVFVgE1GcykI76ReQCOMFw+LZGsh2gy87PAjh2ritY1/UBGFaIhUOArphe
         UF2dICkBuAQEBEqFG2xuNUeLEOc4fxW7gjqeLAPQ9NjODjH2pdJurWyvPbqOKFPgHKr+
         v69DShekuxVSM1ebG7LxYpYEnxrz8LjjO/1GS6cmmSS0k88E859FSMjYRSdxgu+0hBnP
         x8DlCDdlYhcpf5WkT5bdg2EGiK6EurP2rvEC88Wui8Bw/gD62R2SDPaylc3yhxpoorQ/
         Qn6vSLQEpGH9Sr+NUe6qVvI+SD4ja6EF7uThptt3TaThi0xaIQa/7bHWTwWaUSPhpPRN
         lUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
        fh=mpT/oENce3ddLVbMqojF/tsgcwMgssqb7OMLDTG2/fM=;
        b=RdGt82vv+C8KfL11cqAvvSVmHkRbwA4P9rhjVd8CtY8+49D6nfDU3jbEgUmmSNTU6d
         UoTmZGuJ8iLs4PcapPDfukuwEE0DtI1qg8OCxW4p1/PCyNYuoZkmQVCEDrXw4iAKOg8x
         H+neriDoA3t9/F2Bs5p0I7H04BOCbeAgT3K8WugR4xbfGEwKoQarF8tqHFFzbe8VBljp
         xioUNRbU2ZYMM3dCGATVcl7RfV2o8wb9aCYFDd1THMS2DXcpkkL4wy/VFnNK17kBRryH
         78wVsKOFQ4vVUC1C7P2hgeVqDyk+ZrVp2SnR/SGyLNGkLKqTDUXkH+AMy1sEHxdbkZqG
         qciQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791380745; x=1791985545; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
        b=ekzjnccna5tvOJ1ceMjCL/h4mOk7iQGlDd2i++D+aywS1R0XrLLtekDKkM0KrXPtTA
         lYR+ZoQVzhJBkBnirdxPu5Q0rDUZtydeBILRltB0HJ1dBVFt7LUTg472f+10zC738Nmf
         bdo1q1MEc5LD2KViX9pKPdZiyWkKvwQNTQ26iP2iaqBCp/bJocmchkqXhzx+N08vHAW+
         Ls/WPCfhQul+n86M7JpWccP2XIBOkGEMnsWIAxDyXMt1+SSyhfzYJAqNLs+VVl0vlLSF
         PPgWdnECuSBjn16ex/hfrmcx4RMx9hyxN+z2MZfcisVYTVeT627Oh2I+CQT/yyO1s3Sg
         sAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380745; x=1791985545;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
        b=FHsqXpeFkSp5AsqyXQD2rS2XXUTcmPoliINldLET9jWq6d/ThRC7zeT3+FPGp7glIh
         UHZCSZpPQphuOHap9CCw0JuOTTUZYzTR9IV5eCc4wFKBE70/Zxue5wKDiDePVe+nDikF
         OD3QNx0eOdc/vDiA1Pll3yQDtNgPiX+yJBYW3Ev+4SXYLiDJMy3s/DCtJbEkSlY1PBeR
         xW4zR1vnfGa3mWOZPe7iSgWiA0dGiQ3gGz0d1kEK4tiPvV1ZNbGhasthU1wBWVEpyzxy
         yeP178a/ryEMUIAkB70VEapil8mynj8iPbhphHNd1ucEUFkFb2DsHwGufa/xZnxlF3cW
         BZsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDRMX4IN4MnpB28fX4asCdliIGyvkVLCDbHC4eY1fLRlZ0aaOgclObyupGPmjC3C7vOrlaa5rcZgwq@lists.linux.dev
X-Gm-Message-State: AFq9FYKQEB54lWqLuoYzftr4BIHzGESUWcmOfMxcnLLshUf+zw6Jq3I/
	BT8mY90iLCVW3qKrEkaShs/XpjtrFz/iHBSYaTE0deIwuupBoom58htt2CX08NDUxEecqJiweZ7
	Nd/AqQM73Xsh0RciP8k8piSe413JPRTVdEngjGTmO
X-Gm-Gg: AYBFou2KruWatIak8d/Wk74JNWhYL0+XX2sIqKrK9ja60/8qifYTm0+MDGSKAV3sx2p
	U3XeXAMoOE9lk57sAUF/4npM5oiZTkl/dujyjHjLtXFxkfSR6/pfJLvNudvzsJLUsDgPcGBJ+R4
	0xGT0c/GdvNnD+yf64dmdE6AHG7gC+dGcME/m+SXKcQ4En1+joXW/r78PoEWaC+xgrcri0mXwFi
	FHBD1MqUI/xZg/LrHxmvFPfGfmljVbT57Ys0X1fOAr+txWgvgwdq51N3PnGO/z3ZigvUCn0Jhjr
	yFCEvNkdbUhIvnNyHPf9ujvesMUZzdocvOLF899nIuxM/9YrQfoN+y3M
X-Received: by 2002:a05:6512:33d3:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcca66e395mr320554e87.14.1791380744549; Wed, 07 Oct 2026
 06:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-13-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-13-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 15:45:07 +0200
X-Gm-Features: AclHuK9NBZeYXTKdDsAbHTEgR4p43Lr3P06clWDgtHoGILzFBEkx0SOT-Ggr9gA
Message-ID: <CA+EHjTxuAh1zegQGA0-dNAjDBnXUc036WhoGxoUvVmMW1BxdXg@mail.gmail.com>
Subject: Re: [PATCH v23 12/14] KVM: arm64: Abstract out memory abort handling
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Move the memory abort handling under VM specific s2 operation.
>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
