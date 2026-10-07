Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228E34A1DEF
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373157; cv=pass; b=Jwd57R6z95SOFz2k1hCJt8nPtPiHAuMlxfErqOylVmg1xKIsGIf6xIOCR/W4HWqUcsLbbYm9mVNhEMbaOQLS6+SE/yLzEzb963x/LbA1b70ohuAkM0MWEgSt/Yt4EtW/9+LX/Vxkd7uIw97h5xwTEBrOHe3BzsHJz8lK9TdatjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373157; c=relaxed/simple;
	bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnHR1ku9eR2p2YSuJhtxFzSFep3H18EVm8iPKFoeDkTIWgzowneqGDupd7pGQqGZSbRPQdic9F2Y/lqHmpSRGJDz71t+IlIR40GaoiEDf6slX4lYzRYaiAG2eQqGEswRFge5y1YViG0HzX0+CpcRpjrHbHa1eNjNoT1TsSO3CL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=knkIgQLx; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="knkIgQLx"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8152e87.0
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 04:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791373124; cv=none;
        d=google.com; s=arc-20260327;
        b=lbGA4XUmtmKfhjvp6cLZq+y6asiFdr+Hemf+yrXjoRBFx8w+AzCGOKoy0ELwb13OOk
         J1657Gl0L0uN+LZ2UjliPbjXCF3DpEix6YPoeNsxSpMK7s4MbZKJUi3ePEx5vlcyzaQG
         7Wh9Cc46bCMgflNZbSEjCN8HpAIifgQwWuzLxJwzis/oKnEeNIMvsyQ5oAMJdUzWUzrI
         YSSvVSBOetazqMxe5+QsmLW8/oOtQAWtBhaSGU+CPcaHCaRikT/hycPJKPHH4tv3TFH6
         NBTyQkP1vxDxluGmbZdXWbDiFftsbsIDdloSu4yeP+SIuppIRjtVK+S6ldjd+neRPGA8
         2KHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
        fh=ma6iWjdiY6nmFx4PZuQA688rDSvCZfWOPAJiMkUr5cQ=;
        b=M33DQWT4U745vDdEDuFShhTav4V3GK5U7ALykBhI/Cp0ExBzfFTvhuIWSoDqTJewn8
         vJXkN7scYD/I5M95m4Ee3n8W2CeYlbTg3FkMp1AsjgAcJk4u6nWOGk0g/vLuJSZ2CxEX
         rWX+pl9qF1Q1A71L2J6wk32YUpDbAIbcS/be7wTTBkTauwvBy2eyvMyyV5bg9t6Gq500
         q/+v7tnM192wb6X8yCLMqsXYW3FcxKl5uKmlCfHK1vlz56UYLJGhxAr4uF3uzWQlDEk6
         tEDE3g3+LrP1pOSdVlaABGQuHNMfWApWyGcsWqD8UHgzELeoAGGo64+6GcTjlBSRuxTe
         qSfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373124; x=1791977924; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
        b=knkIgQLxeccbbViv57odLKVN1eWe5J8YNkNPbHF+ZatWrn5jZGOK+Rm+ZyCBZAWb3e
         C76NoyEhunayFl0iDldxYUT2B2wmghB6W5SiH3Gci0WxlUeZwpnqM7vrBh276msVuN2p
         KLogrQ5Qr6cc0VZumi8LPV2hIlcXxsFZBMfe1wtchwJSrgcJLNe3cI3fGX40Yrj2NBqe
         qZgITNwM06EUcRBAeDyzVBkpsvNtyGAiTUttnfQ/72dJtE2qIUFOl47lGc+nglM5AoBk
         msLR12sjqLl0e/hM2NeghVDhzQWdK+UQfenu+d9Iyfeu5jZSqWwFIaAb2Evby0bBh2sA
         ylMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373124; x=1791977924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x3BovMqKPyOzodOG6cYU5vpG492YG/WZZeesFshGEqQ=;
        b=r0f0C2/L4JiMCZSuP5uQzxJJ2Hm+Xg6ijRdbSy7xy8G7mgFv7hECI0+i0t+uPap61N
         oQ9oRzt2oMT+q1fsYFFUkXJVaSHW9l54csiQj75MTxApv3hoJfZledwDDo0guUK6ONdc
         YNGYN6/U155JJmMZa0OlokQC4GH1+pLdKlspbtGoo9WN/B7m6EwItwxY3WMSwUMY67Ax
         dPa7euHP4hsxXeRcvKE0TtN93QkuJ0gQ47aXfCTE+1s+FzhAXe8ZLgXNxIpusvII7vIw
         6MT2Xrrt6zXoeeGOvpD3r3gdy7qN7LBCRHejoBjlV6vm48JNBlfVMGVm9f0chOfcopJJ
         HItw==
X-Forwarded-Encrypted: i=1; AKwUvByhTP09V3j4scpCQJMENQo5izcTXb2+FXxds9S3L8p23zskfUa8idMKlndiPolONhHY+fa3QoIzfUrv@lists.linux.dev
X-Gm-Message-State: AFq9FYIXxM7kmK136OwPq2rtuNlYvGbc+wG0Us3xSd05hgNEyav8T2VG
	Fk/e20iIEWYga3IjPMjXiiGO8E20pWInfH39CiFRhyezjLxx46GP80MjeEzHUeVNioQvB/mz/TY
	NmjnE/+ruwjJotOTYmCQu1EZN78MvCoQCf6K8ylKm
X-Gm-Gg: AYBFou2Tse13D/n8QrIBdFNV2aVju4sAxm25dhQyIv4RaiHnQeVMluXTM4m/83J9Dwo
	BFvfxZiaEUYIxgVWEr9lNId93or9zOpJl+8XAaBkPr8fcducOo2oTRf+2fm1dRr+ANdd5tRbQuJ
	brlAAy4p5XdgVIHnLCzoG4q9ujigqlCmRcodPh3D1EXkzO7cxuEj8ocn4ThLwGQuEfSJUNC/LHu
	9FFqe2+3i+B1jlhTVvbV+u9/cuFxYh18AcNR4Ne+CFgFEb7wqiSTb7BgWx96kFlfZUDhjFVmze+
	iIX7udcUw0W1AZY5nuI9YC2zzunXWijHc7U8dB+kSrdJYuM5mnLll2lD8tJzq6m6
X-Received: by 2002:a05:6512:3f0d:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bcca857470mr322236e87.8.1791373123590; Wed, 07 Oct 2026
 04:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-11-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-11-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:38:06 +0200
X-Gm-Features: AclHuK-THf1WIqt3xPRpWJs1Q81-pzVnFszT4A1vRUwtheoFlxrVY7-HpfrRH5U
Message-ID: <CA+EHjTx=CoD5vUN7X6VcuoLeoqXeF_h_JVuhiwaHLBqNraZg8A@mail.gmail.com>
Subject: Re: [PATCH v23 10/14] KVM: arm64: Add VM specific callback for S2 MMU operations
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
> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
