Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C974E3644BC
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 23:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787958061; cv=pass; b=VBaeBqp9mRaznFehwOPTmE5iORq8FTPw3ZyKZr0yo6CvSudY/cxwS5HQ+KhCG+Uh9T/x1dr1YR8ktTBt0TXhU9yXRLRjqjIzv+mWYj1XCBtOwbHlOydTzkZpXDK2LTVssYxr+H+V0BE6tR9o6MGy5q9BIF8a+MHkDYVrsLNqBbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787958061; c=relaxed/simple;
	bh=6T0r+7hZ2bdIBBi+tmMfu3lgh+SjUf2cA/8NWF9EmJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AjOprG8knMgGGr0oY1OczLYkdUOQR5auJcEE9204IbyhCypFhvo9nlyKdfsHRjR5dq2BAZnCbjSmtr4elmwfO2v2XBOe7Ef9vVmrBiRhB4Gk74uEZm2b12CVPvFaJ997VeIhBi28/BKEdsGjUOCeQyo3EWgjpnXHT8jNKmio+cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wSdJS/HJ; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wSdJS/HJ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52fac937235so46331cf.1
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 16:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787958059; cv=none;
        d=google.com; s=arc-20260327;
        b=C3JO9Z4EmfCDbsea4Ql250hIWxYiBTX3JJCXtZ5UktemOg7aN4wMZ4Xderg1nJXG6Q
         OtgfpZmIcEE3xcqb3M5+iD74654IQ/08jnBPoyFmHzw+bmq8m1Y+0l3JSl+LPq20jd0a
         q0c7dYa43yM+ePM5YHMoR5NNrKOMDh7PCtp0znzQ2pDBqX03n552WBSwWCYPsNQRF4Vs
         e8sKx47ZONdyytZG5RLad3QCcOvc/sC69O13DaWL5pelCe9dzmQiXXZgSxlXMXt/+HGe
         phr8G1ipjwKSmd1eSWdJZtctMadX7Q+x6NlGJ8o7zO/FAjCoyA8FIaAxENmiknuByR+5
         KjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6T0r+7hZ2bdIBBi+tmMfu3lgh+SjUf2cA/8NWF9EmJY=;
        fh=zbDVXGW5Fl/8Nfqq14PQ7fJUmylhKnUmk37ew0BTezk=;
        b=KF9Y67BY118fx6m8uJPCWb+nvpSRsK5wNHOcTwwV016LyrKO/37Me22lv+xYnXgdOv
         Rd6/yvGZ2NMhex0u/cb3JqRnAVxas9yvowrQ0iK7Sl9Jxe6gCACJAsxSuFwGNvoENTi6
         BBRONpjTpawp9lXT9+bMYYrHiVgefgpDaL+LZIec75+9T7jbHSD34TxXljuVjxNZ4mdl
         PlKdQy+O1xTfEXtpLcLrme66eNMx+YIUdHorSDYSWrFDJHpfEpkpC8+wtK4otx54DdE4
         JvvP9s2CH2CE/gqqHXoc7MSf7EnhEjV27HTAE5KinbRBx51A24kUVNjGfYuTnnGtFlqr
         OeZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787958059; x=1788562859; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6T0r+7hZ2bdIBBi+tmMfu3lgh+SjUf2cA/8NWF9EmJY=;
        b=wSdJS/HJ/D5Md9o0Z9aDAB8Rtii3PftDZdqVsmvlDfgJUT4FvaTMY0d/UUUDds8rwk
         pdKUlwtKU+gBhW0uK62EovyBEfrjjt8VJbbqSvlLL9rsalklB/AwIiaaJ6Iszmsr6vLy
         X209DjybkdEm7SBU1OELhC5IwBk9YL/JfxKo8MTsguwlx4xovjuXd+WnyrYQ3hgVMNWu
         Ya1mzfp5f0v4ABNK07TtgLJR1sw7dQbK55DhnpB/R2vygra2fmKF/Jl+uEO4HzDTFaMZ
         NMMpb5HckXz/cAMih8PngUJQcG/xK8jbd0OG4FC0LAuFJvsxIDbmh0jxAiD7WHdEOXw+
         otOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787958059; x=1788562859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6T0r+7hZ2bdIBBi+tmMfu3lgh+SjUf2cA/8NWF9EmJY=;
        b=VEuonQokWvsG5hSp0Is4P+RGUK5J/zw1IJkZfj9VE1k7CfKVBB4DRmu0mjUL6m9lBm
         Vs8uWPVeuND40Z+X6WphXD27WfgRTPXFQ3aQF1xBe+6jTRsiJVuvXfo8gK9uzzThd+eb
         wfhHtHuZBTC8XHDJqqYq3RGOCntnOe85BgCTx7qPLH0W3q1T1tUjBeAt4dHFP9QZfD2F
         EUilVYJucar6BDusmVX0Cz8x0NLJJtIFZ4qlEwCCxcyntRIkvpMFMchCjxt12Xg2DjcG
         IpZPsk5TgpBNBwJqxmSjLOcJLJ2FVhPeZ2hZwWRsZgM98brTIE1nS+DOk3UBgmMXWDuF
         e/4g==
X-Forwarded-Encrypted: i=1; AHgh+Rom/zvABkHWSVUYya3hN+tEN0MFIKG2owcjp2a6Q5jQ1W16kZLjyTCz2q1TIsZsNBnH9NHIyZtJFWJt@lists.linux.dev
X-Gm-Message-State: AFuF++l7AP2mg6PoOCV+BYVzNcXBrHeschu5q6VVkvIdrPpnJIOXtfHl
	Bxc86py0/NxsCj8zc5HuTI4+NimBFw/yy6RnScZHkr9BTDyO+611fekIoIe9qjlpkHPS6IGWGc7
	4QAZ/9sHXprlVc67Cq+hlsiWIbcOp2EC0lhdwSHPU
X-Gm-Gg: AR+sD12+gHTyQXM6N7BRhUEbbqM7PZ3ZJ99cImy1QScjAjYxxvm4OP/40SnzYtkESKu
	Xdvb7SPm5s9e/EfCimqJo2MZdPJ9qZXiEGc0SqUKivXmfWr4YvB9WTg5iukhJTZ1Sol9/ev0eiC
	PyBAZKC43ThQifPF5rZEgN2AMweQ2GGCwvxxrOupjQr+BxqWPmKq3sngKBIyaWAa2jALQ9qWtgK
	eO2S9D2vxOM7cYxz6GVM+FNAafy4gYfTD50yK2b3xVZh9NPtBoISfjgJCozYe2jaaPe/82pODV+
	dT0rd34tgdmEH5opLoa18Y24kLmS4XA7xxVLDAojuOHNonWgDzSEXxeuPtX66wapL/lAWf+OktY
	=
X-Received: by 2002:a05:622a:e3d1:10b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-52ff716ce29mr3942111cf.3.1787958057424; Fri, 28 Aug 2026
 16:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-12-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-12-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 16:00:46 -0700
X-Gm-Features: AcwNN1X97irb4_j1CgiMkl1NpgrTMyQT9MylOIwj136cEwhgsDcXkqEaEWN4fto
Message-ID: <CAGtprH8-7_C_CQhKUj816oYyEH_RBPMCu+yPQwhvoAkSkWXapg@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] x86/virt/tdx: Optimize tdx_pamt_get/put()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The Dynamic PAMT get/put helpers use a global spinlock to serialize all
> refcount updates and SEAMCALL invocations. This gives correct behavior fo=
r
> concurrent callers, but leads to contention. It is especially bad from th=
e
> KVM side, which is designed to allow faulting in EPT under a shared lock.
> With the global spinlock, not only is the lock an exclusive one, but it i=
s
> for all TDs instead of just a single one.
>
> But taking the global lock each time is actually unnecessary. Only the 0-=
>1
> and 1->0 refcount transitions actually need the lock (to pair with
> SEAMCALLs that actually add and remove with the Dynamic PAMT pages). The
> common case of incrementing or decrementing a non-zero refcount can be
> done locklessly.
>
> So create a fast and slow path. Check the refcount outside the lock and
> only take it for the slow path (0->1 and 1->0 transitions).
>
> On the put side make the refcount adjustment and lock taking atomic so if
> a 'get' happens between them, it doesn't cause the Dynamic PAMT to be
> freed incorrectly. On the get side there is no technique for doing the
> refcount adjustment and lock atomically, so check the refcount again
> inside the lock.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs. It assisted in identifying/evaluating the stale
> conditionals for the races resolved from the atomic_dec_and_lock() change=
.
> Separate from atomic_dec_and_lock() fallout, it suggested to change
> atomic_inc() to atomic_set(pamt_refcount, 1) in the put error path for th=
e
> sake of being more precise, which Kiryl had also suggested in the past.
> The model also suggested updated comments following the
> atomic_dec_and_lock() change based on some directed prompting. The
> comments were subsequently edited or further prompted for fine tuning.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> ---

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
