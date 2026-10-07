Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74803AF65F
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 11:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372294; cv=pass; b=BS/oer+N4fQYtp1kyukzWzVtls94t64OGtvASIyOJclytAZKkfG6XpsYPqnotpFvwHA806ScjyNn9Lj5F0sC5eGU1QEe2clxl+DwpcxLK+EFw0lb9gP6X4UWD27E2i61PgqasFziIJqBSQbv57mQGhmbm9FHuG5KW9Q/avFKnYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372294; c=relaxed/simple;
	bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYP9s9baEB7FfZjjnqJ1eVXKxa6p+WoHNaJ36ZEmODekHwcG3E1ZwGXde2HhLG23vtyq0yTN3o4PlE6tEfwfjPfTaEuCGssTT+hB4lXs9FdgZXDHvOHsbhzWbeUJm8AjAapUet7dtSsLrqSyewsdkxvTxHQhU5yvAVPK8qijR/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pkl6bObz; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pkl6bObz"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8061e87.0
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 04:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791372276; cv=none;
        d=google.com; s=arc-20260327;
        b=dFox2BxAX+xdQvgrMPhmpDyHkkItLK2PJHbRa+uAgnrx0u7mTxD/h0f+QmGsjlc2Yi
         zFiUN4sZjQDXCOk/gn9j/7dTlo+z/VssneNPtULHyNkQ1FexPt+ByxRRUUuU2DYXDGTu
         IFU5H6SyfZCvK10PUizpzsB4OOiwxTGkD5+kKu3qyT/rK5g+IHORVepOhw4sYTHBLo+z
         zz5YBNgnypRUj7SmWc/PmftQE4DJ3WQWs9k+jKAwwPBp1826KcrGbzC9iDZlmzRxGFnM
         S9Ok3ojAo2VtYQ1LnWw0Rz0/XCMEYVg4zuBhf4CW5ZRhsjaAnoniEzh1MRQTzRQJKtnh
         LDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
        fh=3wRtg6mqbPs7joL54EDSKd0UVdjzFeUDSlc4Y8K33Hs=;
        b=gkmQFJR8w9KnaMYVz3n5B5277ufkt5t/rN6RCougG8hBYeVjQCy1QIhD8OXmgXVgRW
         DYrQcmsm31/r428RoeBGp/KSC0EzOvk0mXf/SvB2CBKFB4abb6zHP6m1O+DttN9sMLU6
         kuH2jYwZdVmEPNJTuTJIjD15rzDksc8E3Xd01gbSdKonuJvimB2HoeVqy6qLbwYxk1Y7
         Cc0C9VezgoC0x7QsKACQHMMT5kpydar4vWb5xQl8wVAnoa3Hz+3aOunxEud9Qe49jMNE
         RFbLAC8y/N3bHB8f+B6oJ0oRMFPfB4PUJGW6TodpfkLsymckKIkm2KsOAjzpSFwAWrj2
         /5Hg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791372276; x=1791977076; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
        b=Pkl6bObzcosEqlKiYGPHrPCbsetJPaSklGV7cFL9srYf12zdpjvBLzm894zjBtD0r6
         IHyuaWfJj7CNL0AY4Zvvf1SAFSC2Vhfj7XqrgtRodTjJQOr2IcbKmQrLYtkaUsZwjk5k
         lFe2d5l1Qx1SIxbSJ+7icGV6u0qItDR0VN48Xna9sLm1aujGFYLdexFNuCkCDkVXbqNF
         3NUT46plwvzJKcu44dzm9BFuygS+hvDL9xpvhNSqFll4iC8GVfsmSx9MfDagWeVfsUSR
         BtOQ5fC4yCc5HUpVWacJNEcCYMspG1DPsFEhUj6VPJaX4A/g7NpegKO49ldvbhuT/Owu
         1pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372276; x=1791977076;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
        b=YU3868maRd2dTtHoBPKyuw0iqJ6vfnXv5xPY8pCGyNtbx2VZEZjz6hH4D1+DhOh42h
         LU6iC7hOMNNLvF8/xXHbkbhQX6Pr0IaE7t9QaZEKxYgAAj8kHN+9qoq02eTAxPkOFAbL
         qpk/Cx6IbxoLCOOdwtTd17lGxnogMxhM0Dnv9WliQ9RIK7Haa51SAEqP7Kd8Uo4qSgKg
         xW3ndubQCvKDhUV4c+XKN6qo5rqnP5owSkwt4Yk7fpJkACJnPUwF+s7FyHAKd0t2VAqJ
         EMRv/+9QG73+mjK6o9ia1w2NS6jcAzR+XL8A9GjSEOlMptqQMMh+nHiI5Ak7hroVQlOT
         IVcA==
X-Forwarded-Encrypted: i=1; AKwUvBxjH7U3jh4JrtGxV+s9qnavyvFKS5pcwGdXmnL8SFYbE1qh+OXGTJYmoiFDFMfIEe2NBo/sp5/ms/NM@lists.linux.dev
X-Gm-Message-State: AFq9FYJodvooxzHznEA+ZsLU90xsdgDhtA6mQE+4OrPj9/C14MnonDtU
	XV4J3B4Xi+oVz14uy+3n0lczqTh/Z215b/9D0TjuKeDbaXoz+8lDm769VBPFDGOjx1ASn2awKRb
	YGGarrIYJoWPsgNHjoKy214QLDH8Y1BVbw13hdDeG
X-Gm-Gg: AYBFou35GAaKwtEzJ4Me1cCjcCfaRtgWjDSmdNvXg1tTMcVV4TaJq/a7NYhz+yfwgC3
	5tSYLqDNuJKPUw0pzayqRjbow6EbAsA4QOpy/LxsR026M55kXHdgt2P0LyK+gERu1KcXG9sZg0L
	5kg9qCN2MG/MHS/FxLlQLxUEJzHq0JAy41IV9DPrYNUrL6/ALEfduwfS1ukiUgLLNjxwu7+pfZS
	rwFNb5CZgtRwXiII7ENosiZaChwC0K8MfDLtp3Zd/ULLUyRY1QWcO2t8Q5v7RgbDCMDCxs3c/VN
	M/KFnBpO/OqlPArWnvmNaccS7ldqBfJQBroyKrpqRhobtzJ5HPbk4w==
X-Received: by 2002:a05:6512:3f0d:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bcca857470mr320723e87.8.1791372275119; Wed, 07 Oct 2026
 04:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-10-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-10-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:23:58 +0200
X-Gm-Features: AclHuK-AkPhTBNuRx-Nil52s88bZX1XXziZHk8i7cIYK8SeGo6JUTxyL14CKqt4
Message-ID: <CA+EHjTwHBasTofGE5YQj0WfyN3v-uHykPxRL57AWJGhAO5Pojg@mail.gmail.com>
Subject: Re: [PATCH v23 09/14] KVM: arm64: Consolidate stage2 unmap range into kvm_stage2_unmap_range
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
> In preparation for adding VM specific backends for stage2 operations,
> nuke __unmap_stage2_range() and fold the logic into
> kvm_stage2_unmap_range(). Also, make kvm_unmap_gfn_range(), the only other
> user of the __unmap_stage2_range() call the kvm_stage2_unmap_range(). Also,
> while at it fix the comment to make it clear that mmu_lock must always be
> held while unmapping. The code already mandates that and the two call paths
> do have the write mmu_lock held.
>
> Later we would replace the logic in kvm_stage2_unmap_range() with VM
> specific backends.
>
> No functional changes intended.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
