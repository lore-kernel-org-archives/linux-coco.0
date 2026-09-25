Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2DC4D09FC
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350495; cv=pass; b=NMYaIuKzB2TmdhoFisHCJP4cwtlOCSOC7lvabp4QeWIbZ+CGmsTSXLHJYsmQbkKh8l2YH/EqJkJOx/1cSnNi1CMcC01YgQAmg0uCikY8Xc9zf1BV1x8wp2IheImnHowU/rJk18yjeHWP4wMeZ745wki1pp3FM+LoJtJ0gKFIk88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350495; c=relaxed/simple;
	bh=c4skHotUrohj5tY649YiUgljNI4R9MsOmUhNsuTt4mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+1bGGQhlWI3b+CdB1JumuopcNyvzpswmbXijTtUx2/wRsRvZnZzm9bcuGMCZI59DIgGSz5BkL0/wOwLl0QtUUfG+0lt/KVO/ZYaRxRQ2tjDpjgy/jCv1wFqvhNftSGWKI7sfRhr0+uV+oi/kJZSQd+sMOBrUfbrghdshr3VNL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i/JG8gyH; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i/JG8gyH"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6afbc52so1005127e87.3
        for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 08:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350490; cv=none;
        d=google.com; s=arc-20260327;
        b=RJsE5BlqptydNd/NLYRzRB6j3u/IcCQekVUp3U7c+RFWOucAufOmqHxFLJ89tzQhNv
         VMRneFOWbfAX2Ih4rZfHQyITV8/d3Ziq+QqRalDenj01LptkwWwd2lXL6K29/+C2TXfl
         LKzGigSORsU1ZhHLfEoczOQWUE8GT4+PxSQ2pFRcp4QYpAW3HCLy2Dmkuek5/ipTzw10
         Rxp/0fh9kJPK3WgRdsSBrIRGpAYcIac1ssI1piUBIVrAvxod3IvdTwfxf3KKDrS83Vi2
         AhMQiO/Cvi6XSeVShNZ0mlk4ShMDpq4S8l6I3NofrzI6yh4MG9GyB/2jXUlchWGGN2DX
         G/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvgREEEhLtnlSAa2TqV+iSmo5cysotPSfNcR8BHubB4=;
        fh=08Qh5ZE/Gc3/zYuij82/CQPTbjMxojqlGUqnEldSep4=;
        b=IH78C5ytNQA8Uhf0MIONa7KYMwqVcRehde/4Ew3cqT06wNxsl6C9WnMVX22pKdGhes
         1euZGrCKDsA+3MKxYLCDYsetO8mr1d4COreMwCBdV8gYPxl9sftM/ftELr0DtYXwwQ/2
         mMYSg7PtM1McdHNPJpBNS4/5C4lHU2EOdFCVu8mAYZYXvqq6FGCunVXqO/5CO/ttW59v
         GY96tgBfb1O6cYIvgXUGAzd1ubhguJAdfMNaluiBc6m5uoysQvvUaiNQ74OjRDIT4HQd
         y0LnD7TeIXzVP33Wm89i2O03Kg9/WgKHpFydSLGsor/KO3VpLx/0wo1Dm8duX8J4FJzE
         qL4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790350490; x=1790955290; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvgREEEhLtnlSAa2TqV+iSmo5cysotPSfNcR8BHubB4=;
        b=i/JG8gyHaV6XQSEHoKvLF20nZY3GTLv/IxdajOeFx/gu5qY2uJfoKM+bz9Y3esotl7
         /RilEM5K4auKuYaDc5+Glzmq4UEpQgFysouXSuWgJdqZ1sW7zIvWFAHz3x88eyTNMGEX
         JEf0D6NQxssSsEToIEkJroxY7Fa0r6SFhj2e2tUuRoBUm42f1oLAC2y/ITRvgetMbaWa
         E/DwSOfrLKOmEXKLy8CBQSQF2luvkR5+WyV+3ySVKfWw0uBhCIMn3PHNx8iiBE6rek8f
         awSnsbDYiupaZ89/A5RgxpvEdoh134AU0EB8y55QhYYhjuqz/K62G4BsBPrtyYo1SOO2
         aKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350490; x=1790955290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvgREEEhLtnlSAa2TqV+iSmo5cysotPSfNcR8BHubB4=;
        b=RbFM+yxzh+T5peFRYLyeifa6a0MiP4e354NSahpL9JoffLhHck3sCyOdVdkZ/QZdfK
         au7FiYhoDaBiRvgnxxV0PsmpI8DnxSAV/P65UK1GnkyLec++5mxD2baYD1/zYoXE9vww
         O3JcYYQA3HHIApFTevLf8u2gftznCMI87z28hbTeNqza9DPM1xeAq51YCI2FBLf2BkTM
         OGCSZKyzTSVD+H5KUNuRnwJl+utf9kI+czp8FtLbRFyFBgtrB+np2GI2KfkJ9LJNa6E7
         nIfiumhp/4ThvRjhUFD+XzOafLX/xmdW25x63mIvlzMdZkDn5tzkKEpxNvFOM+F0NoOV
         Ze8A==
X-Forwarded-Encrypted: i=1; AKwUvBxscCs+AWzFT36kBDgWWvAyb7CtnZkZqQpO57T9nWSNRhwxE4vATQFpPZbwv3ihrQvy/LMYGs8SoedC@lists.linux.dev
X-Gm-Message-State: AFuF++kHB5J6a6N3acotPuHUVk4cORDH7IKesV24sa/xoH2ZMp3XKl7a
	RYTn3JQ/ExFyjHm80P4+2TWEQxFdrh47qNBwI+Djqw+r7Dv2U8z4k9ZPTNVDETOGnNejRcV8gpL
	7RXDl4riC0CH8D/KuQObGdX12SRBam5bAqxSjBL+w
X-Gm-Gg: AYBFou2BfbXl1ZrrYCKLMkxADjhqshGIU9aQReDa3NUf/DBSHq+9+H7CUIgvanvyhfU
	r7rL7hhwZBdJcA5oafP5YVJBSwGa66l8cF8kLUMviRsOn07HA7+pzQ29056pofRN1ylRkRKneNw
	EpYF//t0UjPiO3U6iNmFrpFV+xNZPMdo1XPUFXr+5M/BfxlbA5qyT58cUkYQJpP6r97XUSQ7mVa
	N/zR+PiceBiw+FmuNZspCfuteiM9JYWPl094O8A7tJG3sTfjUPKTpJeSbwQYSC8qV/P0i51VcXD
	Arn6KRgKCzAKunlJ4zhiqU8gFK9AZ+xqfDEt436dPo+oWCPQp+nAGw==
X-Received: by 2002:a05:6512:118c:b0:5b7:5142:d495 with SMTP id
 2adb3069b0e04-5b8df085af7mr1904494e87.64.1790350489353; Fri, 25 Sep 2026
 08:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-6-suzuki.poulose@arm.com> <arZmXFw5Jw2IbAmA@arm.com> <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com>
In-Reply-To: <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Fri, 25 Sep 2026 08:34:37 -0700
X-Gm-Features: AclHuK8ZdVRdb_V4naZFOsXJSH2Fz3e3v_5J12YbiSGiHDcQI7elXhO9Nk5iNy0
Message-ID: <CABpDEu=Dmo6+KpkYwRwYyCWtKjazJvTktVQh6d+2sUM3AchHbg@mail.gmail.com>
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	maz@kernel.org, will@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:02=E2=80=AFAM Suzuki K Poulose <suzuki.poulose@ar=
m.com> wrote:
[...]
> Kdump may be a bit more easier, as the kdump kernel is supposed to use
> the "reserved" region and vmcore access could handle the GPF and
> provide "0"s to the reader ? May be this is one case where the
> host needs to be able to handle GPFs.

I've tested kdump on CCA hardware with a running Realm VM and hit
GPF 0x28 in copy_oldmem_page() when reading pages delegated for
RMM/Realm metadata.
Since do_gpf() already runs fixup_exception(), using
copy_from_kernel_nofault() and falling back to iov_iter_zero() in
copy_oldmem_page() fixes it.

Here is the fix I've tested for the v16 CCA series.


diff --git a/arch/arm64/kernel/crash_dump.c b/arch/arm64/kernel/crash_dump.=
c
index 670e4ce81822..b0ab22293aa9 100644
--- a/arch/arm64/kernel/crash_dump.c
+++ b/arch/arm64/kernel/crash_dump.c
@@ -6,16 +6,28 @@
  * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>
  */

+#include <linux/cpufeature.h>
 #include <linux/crash_dump.h>
 #include <linux/errno.h>
+#include <linux/gfp.h>
 #include <linux/io.h>
+#include <linux/uaccess.h>
 #include <linux/uio.h>
 #include <asm/memory.h>

+static bool system_has_rme(void)
+{
+ u64 pfr0 =3D read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
+
+ return cpuid_feature_extract_unsigned_field(pfr0,
+    ID_AA64PFR0_EL1_RME_SHIFT);
+}
+
 ssize_t copy_oldmem_page(struct iov_iter *iter, unsigned long pfn,
  size_t csize, unsigned long offset)
 {
  void *vaddr;
+ void *buf;

  if (!csize)
  return 0;
@@ -24,8 +36,31 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
unsigned long pfn,
  if (!vaddr)
  return -ENOMEM;

- csize =3D copy_to_iter(vaddr + offset, csize, iter);
+ if (!system_has_rme()) {
+ csize =3D copy_to_iter(vaddr + offset, csize, iter);
+ memunmap(vaddr);
+ return csize;
+ }
+
+ buf =3D (void *)__get_free_page(GFP_KERNEL);
+ if (!buf) {
+ memunmap(vaddr);
+ return -ENOMEM;
+ }
+
+ /*
+ * Pages delegated to the Realm Management Monitor (RMM) or Root
+ * world trigger a synchronous Granule Protection Fault (GPF) when
+ * read from the Non-Secure crash kernel. Use copy_from_kernel_nofault()
+ * so the exception table catches the GPF and fall back to zero-filling
+ * the inaccessible granule.
+ */
+ if (copy_from_kernel_nofault(buf, vaddr + offset, csize))
+ csize =3D iov_iter_zero(csize, iter);
+ else
+ csize =3D copy_to_iter(buf, csize, iter);

+ free_page((unsigned long)buf);
  memunmap(vaddr);

  return csize;
