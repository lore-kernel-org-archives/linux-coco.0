Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079613DAAA0
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735929; cv=pass; b=mu401n/o5GXuB3U8Z0lYjjSBvsj4leu0UeLV4w81Se76/IJH0qRdnKK1Y3ICeiTKRrImW4p7doDjZmtdlNVTSwLHyLp6hiI3oPJC9gGAEzyzbmNLs3lEubTG9/6ltdFt5Ad+fmCHM/gbe+J96zqhj0u7ELhdrh5crt7KPJueYGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735929; c=relaxed/simple;
	bh=PXd4FJsR6tKMFA56Q6aHGGrl17ypmJp1VW4g24+xHhM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ow2J41Rh5reXytWAIFeNZ5wSs8Fo3bbwhHh4XwG0oIhYXTRFWUEQfzOkK4GGKqdvn6ZiAzbIpEsnmO7JfW5fGcnaCOBGzpmJZDs/1mJ4s4mHo504SG++6TylvtT6jhvUJPH7qSG3YNQESSpTMNqdOozto/uktqOL5L/UBl6gBCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LcJKqOs5; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LcJKqOs5"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90cca401c89so6004926d6.2
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787735919; cv=none;
        d=google.com; s=arc-20260327;
        b=IH9dJEQ5nF7fJt4gH+ExNHoRJu/Nhi+Yw2VMDr1tzhIe4wdSoBTwfGh2c3e+se4Xtz
         UK6cYFyWOYpkMaNQFayuZRHiK6m6f1Ka15SvH19tH/UxBrHeQQdx1iZX1ix7OXCdPVNZ
         D7Kp+9HPZGxTIqFWo2Wjt7UbwbIacqDClG8XH9EWxmMiOjXs8G8rmPhvI6X7C9YSVuUv
         RSQ7zrdxB5E4/GGK171fMQ4I7dDD1D573Z1f2K087NN9IZQoCgWA+CJE81mplFtzyARi
         jPRvhibtcYtU4UUVtYr5xNLpIZrPgdfw2DoFEFcx7G2DeOpddW6XEuMwgF2og9V8EivS
         GOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=W29gLyGYJCPLMB1l2BXhwer1rQC/3q6nHb6nCzKL89k=;
        fh=ABFDCKwLdMypHEbiJQhuurT6+um1E9aUsmEIejyNSfo=;
        b=AQdKuKxQXExUEUQQxgLoxbpo/CC4vgpT6+qIHFb+uqlMiJONbWCK6XrbyFtE6cp/DY
         bFwFZ+s935ZegVgkqfIZkLzzghNg2WPXGUdGWDrA53Ty4VfM1oC5bRqXRdxxkkSgFuxy
         rnAa0r/CKhNpH6/JGi0ffGN2rduy4eo+u4ENsJ5I3dAqawZY0I6sHH5JzgLZbs1I2+dg
         necdGVsIGZzbCQl+tNnpWf6rv5+Q+XX/q9tCn/x36J9ylxnUfkLlwT5L+zuiTtofgSbN
         2cJvE6T/ZF3bJgjPfC0mcyf28wUNGj58XH9Sa/0DOF4ZCpKx/CVO5xNzKPRWjpav86rw
         Dpog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735919; x=1788340719; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W29gLyGYJCPLMB1l2BXhwer1rQC/3q6nHb6nCzKL89k=;
        b=LcJKqOs50O0bjgN8tBWx7sQCvW73c28e2+3Hv4hf04cR2TV00ptOmn0IAqVd6oN6gj
         Y+VFO6Xvg6TvVaQwgiNkcZOFtFupBwqTk+n3IlMXJsA/32tsoYzNNVOoxuhuC0OQThEc
         +KZ5WrxODkEjATlMLFkdEJ7JcoNJGQ3STqapbB4z/BuAxM6sWoV44YWNidUwDcgbpkud
         Vu3DNPScgqXXH9NudbpUVqlaiMvzIEa9n/Az9ccO1HPw/23h+YEP4zAMgEZArTUVJtfD
         9OK8ZnJR6PyOUAHAAie5fdI1mn+/OOyz7WS5xDuSueJi/kVtGPMnfLh8DkDfix3aNLo9
         0AwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735919; x=1788340719;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W29gLyGYJCPLMB1l2BXhwer1rQC/3q6nHb6nCzKL89k=;
        b=s61NLi9c5O09BMnn4WlrgMtofSFvAfrDtabRhePP2QMAUmligWSKWpZKYTcao2fADc
         Ec4hma+ilNboODySw8LnbxsNonWE3SAFVThHW7EBeJfLX5YI7OlXYVl/eOwtSZ0xt1kk
         x72r6S3IkHRpM0w/VXkmO/yLtlQcdJgYLki1yRlR/g3VIcfwx1NS682xi4yPGTTnpJrN
         I847w+L2tFGiISh8lR9UYGy3+lSO+blMsvr5Sowy8GgWPvBYEWzsXeEzVMWRoKqRFnX1
         JO8jf2TjfuiSAFC31SEC1QP9iBYQZ2Laj1V47nMt1FNMzdJ5n2W4qjU8lXljpPSbnK2c
         +0QA==
X-Forwarded-Encrypted: i=1; AHgh+RoqmiQClC/vs0xjslDVz12M9CIoKW0PONEP5i7/NXGAlHXVlZJjzUwv2RDbq5I3c9zjmV1+L/+ONDoE@lists.linux.dev
X-Gm-Message-State: AFuF++mHWKPwvQn235gfWUxjSLFbrO+v22m0MppQ3y5iD81E31LBEeg6
	3rPvdEzwcsW7Myv9nnjC/ug43QIMz+GaYHmXjZDL0L1dQJxxwcXnoYNuZGjiypDlJ7WL2u1TbQL
	YvOLr12fDBzS/fGV4ZsDXz4tp8eNpZ7XqikxprxRL
X-Gm-Gg: AR+sD10rxbXji8F4ucFAE3KDV4kjuQcLxgOe+eVqS4euEhLmUSCIaFgNSZytVWD3Nvb
	ebohIUMitmxX/LCtnwfsdbAyXYvRK3Gup1Z2de0RZ9TgfKz/NNF0cLB7n/WR1or6WUD2QmwpXb/
	tbPkkQwUAgTnrXO78hFYRikc1EluTbYVu5mkAGy65lCsFlwo9j/8qbJXIiH+Lq1spxoSZTV2Bik
	XZJ1rpmz5i7dgQyBkXnEadunark5CApUbAX/5RxRX+yKAzcz1SsGVHt/pk/NEOM3YgBpb5PuhAL
	ClCwm7S0aTdD2hEsDQHpxkzl8bz9QEBHiSR0fVdeY1GP8daTSz15eDcTM8KvfmZiaFEzKlCAfPm
	v/aoJOlimhlI1XM6aIluX8ErRHQ2ucg==
X-Received: by 2002:a05:6214:260d:b0:907:94e6:f8bc with SMTP id
 6a1803df08f44-90cc79998c3mr49415816d6.15.1787735918598; Wed, 26 Aug 2026
 02:18:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 02:18:37 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 02:18:37 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ba8d0441-b52f-4357-b2e7-1e352aa385a2@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-9-2fc18ee6d3ba@google.com>
 <13ca60c6-e154-4397-8092-09f861e90fe0@kernel.org> <cbf5f7ca-a960-4fb8-a760-2d2794eb6864@arm.com>
 <CAEvNRgGOyQHnF_b8dk8E0d7_=CcwXtYUdU3ko7Qbep+_O7UC0Q@mail.gmail.com>
 <aoZZMQ3Uc8yQWPNA@google.com> <7eba513d-cdae-4832-abac-038dcdd88517@intel.com>
 <meww2a2uf3yeevsfpicyrlg3hch2x4bsdqv2lsv3vfjxg4qzes@co5eogmhkxrk>
 <ao3lOu8-wpGTs2wd@google.com> <ba8d0441-b52f-4357-b2e7-1e352aa385a2@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 02:18:37 -0700
X-Gm-Features: AcwNN1VwWEAXm7Hyp9OqQou024-MyvsmSKreeFDqqoFiEfe8rutDN4-Z7NuYwk0
Message-ID: <CAEvNRgFXJbV78ktsg=b4srFp1OFjtQWQGuNPjr_MmWD-wOvjgw@mail.gmail.com>
Subject: Re: [PATCH v10 09/41] KVM: guest_memfd: Filter both shared and
 private when invalidating
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Michael Roth <michael.roth@amd.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 8/26/2026 2:55 AM, Sean Christopherson wrote:
>> On Tue, Aug 25, 2026, Michael Roth wrote:
>>> On Wed, Aug 26, 2026 at 12:13:47AM +0800, Xiaoyao Li wrote:
>>>> On 8/20/2026 9:32 AM, Sean Christopherson wrote:
>>>>> And vice versa, a PUNCH_HOLE on a SHARED gmem (if userspace is
>>>>> using an INIT_SHARED gmem for the shared branch of a memslot) could invalidate the
>>>>> PRIVATE mappings (of a different gmem instance).
>>>>
>>>> I'm wondering now how this could happen.
>>>>
>>>> the requirement for PUNCH_HOLE on gmem to trigger mapping invalidation is
>>>> the gmem is bound with the memslot. But how can a memslot bound with two
>>>> gmem instances?
>>>
>>> I think this is for when userspace uses an mmap'able guest_memfd instance
>>> to handle shared memory, and a 'normal' guest_memfd instance for private
>>> memory. Each instance is bound to the same memslot/GPA range, and
>>> KVM_SET_MEMORY_ATTRIBUTES handles switching between the 2.
>
> What I didn't figure out is exactly how the two gmem instances are bound
> to the same memslot.
>
> The case I can imagine is
>
> 1. create gmem1 with GUEST_MEMFD_FLAG_MMAP and
> GUEST_MEMFD_FLAG_INIT_SHARED, and get fd1. mmap the returned fd1 to get
> a hva.
>
> 2. create gmem2 to get a fd2.
>
> 3. call KVM_SET_USER_MEMORY_REGION2 with KVM_MEM_GUEST_MEMFD flag. Pass
> the @hva from 1) to 'userspace_addr' field and pass the gmem fd2 to
> 'guest_memfd' field.
>
> However, with this case, only gmem2 is bound to the memslot while gmem1
> is not. Following PUNCH_HOLE on gmem1 doesn't invalidate any mappings
> because the f->bindings of it is empty.
>
> Do I miss anything?

I think Xiaoyao is right about this, the "vice versa" part is wrong,
since gmem1 has no bindings. Even after kvm_gmem_invalidate_start(),
going via MMU notifiers, that invalidation invalidates only
KVM_FILTER_SHARED, so only gmem1's mappings will get invalidated.

The earlier sentence about PUNCH_HOLE on the PRIVATE guest_memfd (gmem2)
is still correct.

Here's a repeat of the above in pseudocode. (I wanted to make gmem2's
flags=0 more explicit.)

gmem1 = KVM_CREATE_GUEST_MEMFD(flags=MMAP | INIT_SHARED)
gmem2 = KVM_CREATE_GUEST_MEMFD(flags=0)
userspace_addr = mmap(gmem1)
KVM_SET_USER_MEMORY_REGION2(userspace_addr, gmem2)

gmem2 has no MMAP flag, so that KVM will actually fault from gmem1's
memory.


Walking through PUNCH_HOLE on gmem2 again:

gmem_in_place_conversion=n:
  * conversions go to the VM, shared/private tracked at VM level.
stage 2 page tables:
  * private mappings from gmem2
  * shared mappings from gmem1

If guest_memfd invalidates KVM_FILTER_PRIVATE | KVM_FILTER_SHARED, then
gmem1's mappings in the stage2 page tables (which are shared) will be
invalidated along with gmem2's private mappings. That's not great since
we only really wanted to invalidate gmem2's mappings.

If guest_memfd invalidates only KVM_FILTER_PRIVATE (since gmem2 was
created with flags=0), so we will always invalidate just the private
mappings, which is what we expect.


Now I think there's an issue here: with gmem_in_place_conversion=y,
everything is still the same as above, other than where shared/private
is tracked.

gmem_in_place_conversion=y:
  * conversions go to gmem, shared/private tracked in gmem2.
stage 2 page tables:
  * private mappings from gmem2
  * shared mappings from gmem1

This time, the filter lookup will return KVM_FILTER_PRIVATE |
KVM_FILTER_SHARED and we will still invalidate memory from gmem1.

In conversions, a to-private conversion on gmem2 will invalidate
KVM_FILTER_SHARED, which also invalidates gmem1's memory.


Is this just a case of user error? That with gmem_in_place_conversion,
userspace should not use userspace_addr from something other than the
gmem for the same memslot?

We previously discussed that validating userspace_addr belonging to the
gmem for the same memslot is pointless since userspace can later remap
userspace_addr to something else.

One option is to say if the gmem doesn't have MMAP set, always only
invalidate (filter &= KVM_FILTER_PRIVATE). That means a to-private
conversion on gmem2 will not invalidate the shared mappings from
gmem1. That would break implicit conversions to shared, since a
to-shared access sees the shared mappings and doesn't cause an exit.

Perhaps we can iterate the maple tree and present folios and invalidate
exactly the folios matching the shared/private status and gmem, but this
is quite complicated and I hope we can avoid this.

What if we say, for gmem_in_place_conversion=y, set
KVM_MEMSLOT_GMEM_ONLY for all guest_memfd memslots. This way, the host
can still use gmem1 for userspace_addr (user error).

KVM won't be using userspace_addr at all other than kvm_read_guest /
kvm_write_guest, and for those, we previously discussed that it is a
user error.


Xiaoyao, any suggestions to solve the problem?


Meanwhile, I'll still post v11 to resolve the other comments first.
