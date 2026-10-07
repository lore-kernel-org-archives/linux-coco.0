Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5BF4963A2
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 10:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369909; cv=none; b=Hq/2Vlo7H9D1R3CGTd+2+FHG8vvHomBbNtrNnFsYRDv0scHAZAyKbcnK7tfyqWB7+fr3UXjj64j58JM9s3IwHoNLsg0ZNAGkQ8c6BP2kWnH2odDZBY131ctmpMFqz2B4UDsqQuMrl9e7CRIWXIzHpIceSVNRuiIAekp+hjXuvzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369909; c=relaxed/simple;
	bh=/01lQesds7Qu15IlWJStcj8pAkrlNp3+XW9pTMK80Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtW+wUSgvDSxx4DlyjVqTvqPJfBOxGIIIjjwx3qus+aRJlaG4OlHuK3xieMrRr2VkvWocllA/cDR5c1qfMqCZjkWqqWL4qi36Bx2zdykz/4h59QD5wTIdx6q7TeEmWC+LsH75V4Ip4g1dJUYv6SWO5nCVg89hkJ6k2/ghsZIinI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ORWhDxxZ; arc=none smtp.client-ip=91.218.175.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ORWhDxxZ"
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=/01lQesds7Qu15IlWJStcj8pAkrlNp3+XW9pTMK80Mw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791369866; v=1; x=1791974666;
 b=ORWhDxxZkI0U4JGf7NsOpwDiVb+2aZ5xrz8z0GNale1mwHcKxKIk2K9GNw6d2dJRo96bo6U4
 HKDxTW0XNk9PdzlKTYKH1hPOUaNyikCFOfhgZz8Jh1bagYzed6B7gf6V6PDj2SwDA9s+xFppMAx
 97lemgnHFT3B8iDNGP+8eoMY=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d6b527c0a5c386e5;
	Wed, 07 Oct 2026 10:44:26 +0000
X-Mizu-Trace-ID: d6b527c0a5c386e5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5461e87.1
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 03:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6iZIH2ubxLuUdPaenEUadxblurYJ6FwaQpeBKxyqbn2EeRtQJLjqIYcQENKlQPTpSf0N4L+rrWPeg@lists.linux.dev
X-Gm-Message-State: AFq9FYL+Ps6XzCIPIksiJpBXOQ2ruKWgbl2c3n98dGgvRoeTSdZTD4Pa
	vyeC8B6wDlCADkoGbJvpA4DdPggIRHyAibwrKUeFKV7OVAWAy5I4Qwb5FnVQ3JshB6t+5kg6+tf
	x0Jv4kstvDnLWysONU3BltcxplQRkl4qp4/ORZVWh
X-Received: by 2002:a05:6512:2c9b:b0:5bb:27df:415f with SMTP id
 2adb3069b0e04-5bcca969b08mr280500e87.15.1791369860573; Wed, 07 Oct 2026
 03:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-2-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-2-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 12:43:44 +0200
X-Gmail-Original-Message-ID: <CA+EHjTy44W8srPO2y2MJT7nijeWcek-BLsiwYfSPXVOA8DpRCQ@mail.gmail.com>
X-Gm-Features: AclHuK9bYO3-lIjbLvu1WEmia2gdqzHBdvJpWxSZu00WMWjDLerDBVC4C9fwiYI
Message-ID: <CA+EHjTy44W8srPO2y2MJT7nijeWcek-BLsiwYfSPXVOA8DpRCQ@mail.gmail.com>
Subject: Re: [PATCH v23 01/14] KVM: arm64: protected VM: Handle user writes to CNTVCT_EL0/CNTPCT_EL0
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

On Wed, 7 Oct 2026 at 09:35, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Protected VMs doesn't allow setting offsets for virtual and physical
> counters, as the offset is always fixed to 0. The VM ioctl is filtered
> out based on the cap. However we don't prevent the userspace from trying
> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
>
> Fix this by always "fixing" the timer offsets to 0 and marking that the
> timer offset is set in the kvm->arch.flags at KVM init time for protected
> VMs. This prevents the access to the VM specific vm_offset at low cost.
> A userspace writing to the CNT*CT_EL0 would observe success, without
> any real effect. This is cleaner over spilling "*_is_protected()"
> checks and "matches" what we really do in practise. i.e., always run
> with "fixed counter offset of 0".
>
> Reported by Sashiko
>
> Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
> Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
